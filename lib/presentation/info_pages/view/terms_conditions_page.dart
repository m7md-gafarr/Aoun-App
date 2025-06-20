import 'package:aoun_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: S.of(context).terms_conditions_title),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              S.of(context).terms_conditions_header,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
            const SizedBox(height: 16),

            // Introduction
            _buildIntroduction(context),

            const SizedBox(height: 24),

            // Expandable sections
            _buildExpandableSection(
              context,
              S.of(context).terms_conditions_contractual_relationship_title,
              S.of(context).terms_conditions_contractual_relationship_content,
              Icons.handshake,
            ),

            _buildExpandableSection(
              context,
              S.of(context).terms_conditions_amendments_title,
              S.of(context).terms_conditions_amendments_content,
              Icons.update,
            ),

            _buildExpandableSection(
              context,
              S.of(context).terms_conditions_services_title,
              S.of(context).terms_conditions_services_content,
              Icons.directions_car,
            ),

            _buildExpandableSection(
              context,
              S.of(context).terms_conditions_license_title,
              S.of(context).terms_conditions_license_content,
              Icons.linked_camera,
            ),

            _buildExpandableSection(
              context,
              S.of(context).terms_conditions_restrictions_title,
              S.of(context).terms_conditions_restrictions_content,
              Icons.block,
            ),

            _buildExpandableSection(
              context,
              S.of(context).terms_conditions_provision_title,
              S.of(context).terms_conditions_provision_content,
              Icons.business,
            ),

            _buildExpandableSection(
              context,
              S.of(context).terms_conditions_third_party_title,
              S.of(context).terms_conditions_third_party_content,
              Icons.apps,
            ),

            _buildExpandableSection(
              context,
              S.of(context).terms_conditions_ownership_title,
              S.of(context).terms_conditions_ownership_content,
              Icons.copyright,
            ),

            const SizedBox(height: 24),

            // Contact information
            _buildContactSection(context),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroduction(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
        ),
      ),
      child: Text(
        S.of(context).terms_conditions_introduction,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              height: 1.5,
            ),
      ),
    );
  }

  Widget _buildExpandableSection(
    BuildContext context,
    String title,
    String content,
    IconData icon,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: 2,
      child: ExpansionTile(
        leading: Icon(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              content,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    height: 1.6,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.contact_support,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 8),
              Text(
                S.of(context).terms_conditions_need_help_title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).terms_conditions_need_help_content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.info_outline,
                size: 16,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  S.of(context).terms_conditions_acknowledgment,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
