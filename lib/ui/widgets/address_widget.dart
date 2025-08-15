import 'package:flutter/material.dart';
import 'package:flutter_application/model/cep_model.dart';

class AddressWidget extends StatelessWidget {
  final CepModel cepModel;
  const AddressWidget({super.key, required this.cepModel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (cepModel == null) {
      return SizedBox.shrink();
    }
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),

            gradient: LinearGradient(
              colors: [
                theme.colorScheme.primary.withValues(alpha: 0.4),
                theme.colorScheme.secondary,
              ],
            ),
          ),
          child: Column(
            children: [
              Icon(
                Icons.check_circle_rounded,
                color: Colors.white,
                size: 40,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'CEP encontrado',
                style: theme.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
              ),
              Text(
                'Informaçoes do endereço',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        _InfoCard(
          icon: Icons.numbers,
          title: 'CEP',
          subtitle: cepModel.cep,
        ),

        _InfoCard(
          icon: Icons.house,
          title: 'Logradouro ',
          subtitle: cepModel.logradouro,
        ),
        _InfoCard(
          icon: Icons.loupe_outlined,
          title: 'Complemento',
          subtitle: cepModel.complemento,
        ),
        _InfoCard(
          icon: Icons.location_on_rounded,
          title: 'Bairro',
          subtitle: cepModel.bairro,
        ),
        _InfoCard(
          icon: Icons.add_road_sharp,
          title: 'Localidade',
          subtitle: cepModel.localidade,
        ),
        _InfoCard(
          icon: Icons.maps_home_work_rounded,
          title: 'UF',
          subtitle: cepModel.uf,
        ),
        _InfoCard(
          icon: Icons.area_chart_outlined,
          title: 'Estado',
          subtitle: cepModel.estado,
        ),
        _InfoCard(
          icon: Icons.map_sharp,
          title: 'Regiao',
          subtitle: cepModel.regiao,
        ),
        _InfoCard(
          icon: Icons.phone,
          title: 'DDD',
          subtitle: cepModel.ddd,
        ),
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _InfoCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.3), width: 2),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 15,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  title,
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  subtitle,
                  style: theme.textTheme.titleSmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
