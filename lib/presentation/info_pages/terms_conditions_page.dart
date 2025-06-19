import 'package:flutter/material.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Terms & Conditions"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              "Terms of Use",
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
              "Contractual Relationship",
              """These Terms of Use ("Terms") govern the access or use by you, an individual, from within any country in the world (excluding the United States and its territories and possessions and Mainland China) of applications, websites, content, call center, technology platform, e-payment services, products, and services (collectively, the "Auan Services") made available by Auan Inc.

These Terms constitute a legally binding agreement between you and your local Auan entity. Please read these Terms carefully before accessing or using the Auan Services. If you do not agree to be bound by the Terms, you may not use or access the Auan Services.

Your access and use of the Auan Services constitutes your agreement to be bound by these Terms, which establishes a contractual relationship between you, Auan, and your local Auan entity. These Terms expressly supersede prior agreements or arrangements with you.

Auan may immediately terminate these Terms or any of the Auan Services with respect to you, or generally cease offering or deny access to the Auan Services or any portion thereof, at any time for any reason.""",
              Icons.handshake,
            ),

            _buildExpandableSection(
              context,
              "Amendments and Supplemental Terms",
              """Supplemental terms may apply to certain Auan Services, such as policies for a particular event, activity, or promotion, and such supplemental terms will be disclosed to you in connection with the applicable Auan Services. Supplemental terms are in addition to, and shall be deemed a part of, the Terms for the purposes and period of the applicable Auan Services.

Auan may amend the Terms related to the Auan Services from time to time. Amendments will be effective upon Auan posting such updated Terms at this location or the amended policies or supplemental terms on the applicable Service. Your continued access or use of the Auan Services after such posting constitutes your consent to be bound by the Terms, as amended.

Our collection and use of your personal information is provided in Auan's Privacy Policy, which can be accessed at https://swvl.com/privacy_policy.""",
              Icons.update,
            ),

            _buildExpandableSection(
              context,
              "The Auan Services",
              """The Auan Services constitute a technology platform that enables users of Auan's mobile applications or websites provided as part of the Auan Services (each, an "Application") to arrange and schedule transportation services with independent third-party providers of such services, including independent third-party transportation providers under agreement with Auan or certain of Auan's Affiliates ("Third Party Providers").

Unless otherwise agreed by Auan in a separate written agreement with you, the Auan Services are made available solely for your personal and non-commercial use. Each service provided by a Third Party Provider to you shall constitute a separate legal agreement between you and the Third Party Provider.

You acknowledge that Auan does not provide any form of transportation services or function as a transportation carrier or service provider or own any vehicles for transportation and that all such transportation services are provided by Third Party Providers who are not employed by Auan or any of its Affiliates nor operate under their control.""",
              Icons.directions_car,
            ),

            _buildExpandableSection(
              context,
              "License",
              """Subject to your compliance with these Terms, Auan grants you a limited, non-exclusive, non-sublicensable, non-assignable, revocable, and non-transferable license to:

• Access and use the Applications on your personal device solely in connection with your use of the Auan Services

• Access and use any content, information, and related materials that may be made available through the Auan Services, in each case solely for your personal and non-commercial use

Any rights not expressly granted herein are reserved by Auan and Auan's licensors.""",
              Icons.linked_camera,
            ),

            _buildExpandableSection(
              context,
              "Restrictions",
              """You specifically agree not to, without the prior explicit written consent of Auan:

• Remove any copyright, trademark, or other proprietary notices from any portion of the Auan Services

• Reproduce, modify, prepare derivative works based upon, distribute, license, lease, sell, resell, transfer, publicly display, publicly perform, transmit, stream, broadcast, or otherwise exploit the Auan Services except as expressly permitted by Auan

• Decompile, reverse engineer, or disassemble the Auan Services

• Link to, mirror, or frame any portion of the Auan Services

• Cause or launch any programs or scripts for the purpose of scraping, indexing, surveying, or otherwise data mining any portion of the Auan Services

• Attempt to gain unauthorized access to or impair any aspect of the Auan Services or its related systems or networks""",
              Icons.block,
            ),

            _buildExpandableSection(
              context,
              "Provision of Auan Services",
              """You acknowledge that portions of the Auan Services may be made available under Auan's various brands or request options associated with transportation, including the transportation request brands currently referred to as "Premium" and "Economy."

You also acknowledge that the Auan Services may be made available under such brands or request options by or in connection with:

• Certain of Auan's Affiliates
• Independent Third Party Providers, including transportation network company drivers, transportation charter permit holders, or holders of similar transportation permits, authorizations, or licenses""",
              Icons.business,
            ),

            _buildExpandableSection(
              context,
              "Third Party Services and Content",
              """The Auan Services may be made available or accessed in connection with third-party services and content (including advertising) that Auan does not control. You acknowledge that different terms of use and privacy policies may apply to your use of such third-party services and content.

Auan does not endorse such third-party services and content, and in no event shall Auan be responsible or liable for any products or services of such third-party providers.

Additionally, Apple Inc., Google, Inc., or the provider of any other applicable mobile operating system and/or their applicable international subsidiaries and affiliates will be third-party beneficiaries to these Terms if you access the Auan Services using Applications developed for Apple iOS, Android, or any other applicable operating system-powered mobile devices, respectively.""",
              Icons.apps,
            ),

            _buildExpandableSection(
              context,
              "Ownership",
              """The Auan Services and all rights therein are and shall remain Auan's property or the property of Auan's licensors. Neither these Terms nor your use of the Auan Services convey or grant to you any rights:

• In or related to the Auan Services except for the limited license granted above

• To use or reference in any manner Auan's company names, logos, product and service names, trademarks, or service marks or those of Auan's licensors irrespective of whether or not they are registered or unregistered""",
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
        '''These Terms of Use govern your access and use of Auan Services made available by Auan Inc., a private limited liability company established in the British Virgin Islands.

By accessing or using the Auan Services, you agree to be bound by these Terms, which establish a contractual relationship between you and Auan. Please read these Terms carefully before using our services.''',
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
                "Need Help?",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "If you have any questions about these Terms of Use or need assistance with our services, please contact our support team.",
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
                  "By continuing to use Auan Services, you acknowledge that you have read, understood, and agree to be bound by these Terms.",
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
