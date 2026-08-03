import 'package:flutter/material.dart';

class PainelInformacoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.info_outline, color: Colors.blue.shade700),
                SizedBox(width: 8),
                Text(
                  'Informações Extras',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Divider(height: 24),
            _InfoRow(Icons.water_drop, 'Umidade', '65%'),
            SizedBox(height: 12),
            _InfoRow(Icons.air, 'Vento', '12 km/h'),
            SizedBox(height: 12),
            _InfoRow(Icons.thermostat, 'Sensação térmica', '30°C'),
            SizedBox(height: 12),
            _InfoRow(Icons.wb_sunny_outlined, 'Nascer do sol', '06:10'),
            SizedBox(height: 12),
            _InfoRow(Icons.nightlight_round, 'Pôr do sol', '18:42'),
            SizedBox(height: 12),
            _InfoRow(Icons.compress, 'Pressão', '1013 hPa'),
            SizedBox(height: 12),
            _InfoRow(Icons.visibility, 'Visibilidade', '10 km'),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icone;
  final String label;
  final String valor;

  _InfoRow(this.icone, this.label, this.valor);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icone, size: 20, color: Colors.blue.shade600),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 14,
            ),
          ),
        ),
        Text(
          valor,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}