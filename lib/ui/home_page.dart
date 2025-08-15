import 'package:flutter/material.dart';
import 'package:flutter_application/model/cep_model.dart';
import 'package:flutter_application/repositories/cep_repository.dart';
import 'package:flutter_application/ui/theme.dart';
import 'package:flutter_application/ui/widgets/address_widget.dart';
import 'package:http/http.dart' as http;
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final repository = CepRepository(client: http.Client());
  final cepController = TextEditingController();
  final cepFormatter = MaskTextInputFormatter(
    mask: '#####-###',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  String? errorMsg;
  CepModel? cepModel;
  bool isLoading = false;

  Future<void> buscarCep() async {
    FocusScope.of(context).unfocus();
    setState(() {
      errorMsg = null;
      cepModel = null;
      isLoading = true;
    });

    final cep = cepController.text.trim();
    if (cep.isEmpty) {
      setState(() {
        errorMsg = 'Por favor digite um CEP válido';
        isLoading = false;
      });
      return;
    }
    try {
      final addressModel = await repository.consultarCep(cep);
      if (addressModel == null || addressModel.cep.isEmpty) {
        setState(() {
          errorMsg = 'CEP não encontrado';
        });
        return;
      }
      setState(() {
        cepModel = addressModel;
        isLoading = false;
        errorMsg = null;
      });
    } catch (e) {
      setState(() {
        errorMsg = 'Erro ao buscar endereço';
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    cepController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de CEP'),
        leading: const Icon(Icons.location_city_outlined),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Cabeçalho
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    theme.colorScheme.primary.withValues(alpha: 0.4),
                    theme.colorScheme.secondary,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Text(
                    'A sua plataforma de busca por CEP!',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Receba as informações completas através de uma simples pesquisa!',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Campo de texto
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                inputFormatters: [cepFormatter],
                controller: cepController, // corrigido
                keyboardType: TextInputType.number,
                maxLength: 9,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.location_on_outlined),
                  labelText: 'CEP',
                  hintText: 'Digite o CEP',
                  counterText: '',
                ),
              ),
            ),

            AnimatedSwitcher(
              duration: Duration(milliseconds: 1),
              child: isLoading
                  ? Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Buscando CEP...',
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ElevatedButton.icon(
                      style: theme.elevatedButtonTheme.style,
                      onPressed: buscarCep,
                      icon: Icon(
                        Icons.search_outlined,
                        color: AppTheme.primaryColor,
                      ),
                      label: Text(
                        'Buscar',
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
            ),

            const SizedBox(height: 15),

            if (errorMsg != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.error,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.error_outline_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      errorMsg!,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 10),
            if (cepModel != null)
              AnimatedOpacity(
                opacity: cepModel != null ? 1.0 : 0.0,
                duration: Duration(milliseconds: 300),
                child: AddressWidget(
                  cepModel: cepModel!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
