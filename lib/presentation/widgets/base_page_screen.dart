import 'package:flutter/material.dart';
import 'dashboard_sidebar.dart';
import 'dashboard_header.dart';

/// Base Page Screen Template
/// Matches the frontend FarmArchive design exactly
class BasePageScreen extends StatelessWidget {
  final String currentRoute;
  final Function(String) onNavigate;
  final VoidCallback onLogout;
  final String pageTitle;
  final String pageSubtitle;
  final IconData pageIcon;
  final Color? iconBackgroundColor;
  final Widget? actionButton;
  final Widget child;
  final TextEditingController? searchController;
  final String? username;
  final String? roleLabel;

  const BasePageScreen({
    super.key,
    required this.currentRoute,
    required this.onNavigate,
    required this.onLogout,
    required this.pageTitle,
    required this.pageSubtitle,
    required this.pageIcon,
    this.iconBackgroundColor,
    this.actionButton,
    required this.child,
    this.searchController,
    this.username,
    this.roleLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFFF1F5F9,
      ), // bg-slate-100 (matches frontend)
      body: Row(
        children: [
          // Sidebar Navigation
          DashboardSidebar(
            currentRoute: currentRoute,
            onNavigate: onNavigate,
            onLogout: onLogout,
          ),

          // Main Content Area
          Expanded(
            child: Column(
              children: [
                // Header Bar
                DashboardHeader(
                  searchController: searchController,
                  username: username,
                  roleLabel: roleLabel,
                ),

                // Main Content Area
                Expanded(
                  child: Container(
                    color: const Color(0xFFF1F5F9), // bg-slate-100
                    padding: const EdgeInsets.all(24), // p-6
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Page Header Section
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 40, // w-10
                                  height: 40, // h-10
                                  decoration: BoxDecoration(
                                    color:
                                        iconBackgroundColor ??
                                        const Color(
                                          0xFFF3E8FF,
                                        ), // bg-purple-100
                                    borderRadius: BorderRadius.circular(
                                      8,
                                    ), // rounded-lg
                                  ),
                                  child: Icon(
                                    pageIcon,
                                    color: iconBackgroundColor != null
                                        ? Colors.white
                                        : const Color(
                                            0xFF9333EA,
                                          ), // text-purple-600
                                    size: 20, // w-5 h-5
                                  ),
                                ),
                                const SizedBox(width: 12), // gap-3
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      pageTitle,
                                      style: const TextStyle(
                                        fontSize: 20, // text-2xl
                                        fontWeight: FontWeight.bold,
                                        color: Color(
                                          0xFF0F172A,
                                        ), // text-slate-900
                                      ),
                                    ),
                                    const SizedBox(height: 8), // mb-2
                                    Text(
                                      pageSubtitle,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Color(
                                          0xFF475569,
                                        ), // text-slate-600
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            if (actionButton != null) actionButton!,
                          ],
                        ),

                        const SizedBox(height: 24), // space-y-6
                        // Page Content
                        Expanded(child: child),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
