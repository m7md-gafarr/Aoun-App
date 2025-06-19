import 'package:flutter/material.dart';
import 'package:aoun_app/presentation/widgets/common/appBar_widget.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Privacy Policy"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              "Understanding Our Commitment to Your Privacy",
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
              "User's Acknowledgement of This Policy",
              """By using the services or registering, downloading, or entering the websites and/or the apps, you acknowledge that you are or have had the opportunity to become aware of this policy, including the processing (including collecting, using, disclosing, retaining, or disposing) of your information.

The information Auan holds about you may be held and processed on computer and/or paper files. If you provide Auan with any information regarding another person, it is your responsibility to make them aware of this policy.

If you have any questions or comments regarding privacy issues, please contact us at legal@swvl.com.""",
              Icons.policy,
            ),

            _buildExpandableSection(
              context,
              "Types of Information We Collect",
              """Auan collects both "Personal Information" and "Anonymous Information" about you:

• Personal Information: Information that can be used to identify you, such as your full name, email address, phone number, payment method, password, mailing address, IP address, profile picture, location, as well as information that is linked to such information.

• Anonymous Information: Information that we cannot use to identify you and is not linked to information that can be used to do so. It includes passively collected information about your activities on the websites or apps, such as use and usage data.

We also passively collect certain information from your devices, such as your IP address, screen resolution information, geographic location, Wi-Fi information, browser information, unique device identifier (UDID) and/or your mobile operating system.""",
              Icons.info_outline,
            ),

            _buildExpandableSection(
              context,
              "Voluntarily Submitted Information",
              """We collect information that you provide to us during your use of the Services:

• Personal information during registration: full name, email address, phone number, payment method, billing information, profile picture, and profile information
• Communications with us or with captains (emails, in-app messages, photos, text messages, written instructions)
• User preference information: marketing preferences, communication preferences, home address, work address, favorites, and survey responses
• Information provided to customer support via email, phone, apps, SMS, social media messaging, or other channels
• Posts on forums or message boards, including Auan's social media pages
• Data provided in promotions, competitions, feedback forms, or service-related issues

Note: Some information is mandatory to create an account and use our Services.""",
              Icons.person_add,
            ),

            _buildExpandableSection(
              context,
              "Information Collected Through Service Use",
              """• Geolocation Data: If you access the apps through a mobile device, we may collect GPS coordinates of your trip (including pickup and drop-off data and route information) or similar location information.

• Contacts: We may access your calendar or contacts with your permission.

• Transaction Data: We collect information created during your interactions with services, including:
  - Date and time of orders
  - Captain acceptance and arrival
  - Service completion details
  - Distance traveled
  - Amount charged (base fee, tip, additional fees)
  - Promotional code usage""",
              Icons.location_on,
            ),

            _buildExpandableSection(
              context,
              "Information Provided by Others",
              """• We collect information that passengers provide about captains, and vice versa, including ratings, complaints, and postings on forums or message boards
• Auan may receive information about you from affiliated websites or services
• We work with third parties (business partners, subcontractors, payment processors, advertising networks, analytics providers, search information providers, and credit reference agencies) and may receive information about you from them
• Where third parties collect information about you and share it with us, you should refer to their separately maintained privacy policies""",
              Icons.people,
            ),

            _buildExpandableSection(
              context,
              "Cookies and Web Technologies",
              """The websites use cookies and related technologies for:
• Site functionality
• Analytics
• Advertising

The use of these technologies can involve the processing of personal data. For more information about how we use cookies and related technologies, and your choices regarding cookies, please refer to our Cookies Notice.""",
              Icons.cookie,
            ),

            _buildExpandableSection(
              context,
              "Security of Your Information",
              """Auan has implemented administrative, physical, and electronic measures designed to protect your information from unauthorized access, modification, and unavailability.

We will comply with applicable law in the event of any breach of security, confidentiality, or integrity of your Personal Data and, where appropriate or required by law, notify you via email, text, or website posting in the most expedient time possible.

Although guaranteed security does not exist either on or off the Internet, we make commercially reasonable efforts to ensure the collection and security of information are consistent with this Policy and all applicable laws and regulations.""",
              Icons.security,
            ),

            _buildExpandableSection(
              context,
              "Location of Your Information",
              """Your Personal Information may be disclosed to other Auan entities and third parties (including service providers) in jurisdictions including, but not limited to: British Virgin Islands, Egypt, Kenya, Pakistan, and United Arab Emirates.

The data that Auan collects from you may be transferred to and stored in a country that is not considered to offer an adequate level of protection under your local laws. It may also be processed by staff operating outside of your country of residence.

By submitting your Personal Information, you acknowledge and, where necessary under local laws, agree to this transfer, storage, or processing.""",
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
        '''Auan Inc., its respective subsidiaries, affiliates, associated companies, and jointly controlled entities (collectively "Auan," "we," "our," or "us") appreciate your need for protection of your personal data and are committed to protecting and respecting the privacy of all persons contacting, visiting, or otherwise submitting information to Auan.

This Privacy Policy describes how Auan collects, uses, processes, and discloses your Personal Data through the use of Auan's Apps and Websites, products, features, and other services globally. This Policy applies to passengers, agents, vendors, suppliers, partners, contractors, and service providers.''',
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
                "Contact Us",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            "If you have any questions or comments regarding privacy issues, please contact us:",
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
                "umssthasystem@gmail.com",
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
