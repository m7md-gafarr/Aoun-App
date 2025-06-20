import 'package:flutter/material.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';
import 'package:aoun_app/generated/l10n.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: S.of(context).privacy_policy_title),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              S.of(context).privacy_policy_header,
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
              S.of(context).privacy_policy_acknowledgment_title,
              S.of(context).privacy_policy_acknowledgment_content,
              Icons.policy,
            ),

            _buildExpandableSection(
              context,
              S.of(context).privacy_policy_types_info_title,
              S.of(context).privacy_policy_types_info_content,
              Icons.info_outline,
            ),

            _buildExpandableSection(
              context,
              S.of(context).privacy_policy_voluntary_info_title,
              S.of(context).privacy_policy_voluntary_info_content,
              Icons.person_add,
            ),

            _buildExpandableSection(
              context,
              S.of(context).privacy_policy_service_use_title,
              S.of(context).privacy_policy_service_use_content,
              Icons.location_on,
            ),

            _buildExpandableSection(
              context,
              S.of(context).privacy_policy_others_info_title,
              S.of(context).privacy_policy_others_info_content,
              Icons.people,
            ),

            _buildExpandableSection(
              context,
              S.of(context).privacy_policy_cookies_title,
              S.of(context).privacy_policy_cookies_content,
              Icons.cookie,
            ),

            _buildExpandableSection(
              context,
              S.of(context).privacy_policy_security_title,
              S.of(context).privacy_policy_security_content,
              Icons.security,
            ),

            _buildExpandableSection(
              context,
              S.of(context).privacy_policy_location_title,
              S.of(context).privacy_policy_location_content,
              Icons.public,
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
        S.of(context).privacy_policy_introduction,
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
                S.of(context).privacy_policy_contact_title,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            S.of(context).privacy_policy_contact_content,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                Icons.email,
                size: 16,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 8),
              Text(
                S.of(context).privacy_policy_contact_email,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
