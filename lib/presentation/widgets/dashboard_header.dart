import 'package:flutter/material.dart';

/// Presentation Widget - Dashboard Header
/// Matches the frontend FarmArchive design exactly
class DashboardHeader extends StatelessWidget {
  final TextEditingController? searchController;
  final String? username;
  final String? roleLabel;

  const DashboardHeader({
    super.key,
    this.searchController,
    this.username,
    this.roleLabel,
  });

  @override
  Widget build(BuildContext context) {
    final displayUsername = username ?? 'User';
    final displayRole = roleLabel ?? 'Admin';

    return Container(
      height: 64, // Header height
      color: const Color(0xFF0F172A), // bg-slate-900
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF1E293B),
            width: 1,
          ), // border-slate-800
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ), // px-6 py-4
      child: Row(
        children: [
          // Search Bar (on the left)
          Expanded(
            flex: 1,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 384), // max-w-md
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B), // bg-slate-800
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: const Color(0xFF334155),
                  ), // border-slate-700
                ),
                child: TextField(
                  controller: searchController,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: const TextStyle(
                      color: Color(0xFF94A3B8),
                    ), // text-slate-400
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFF94A3B8), // text-slate-400
                      size: 16, // h-4 w-4
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(width: 16), // gap-4
          // Right side actions
          Row(
            children: [
              // User Info
              Row(
                children: [
                  const Icon(
                    Icons.people,
                    color: Color(0xFFCBD5E1), // text-slate-300
                    size: 20, // h-5 w-5
                  ),
                  const SizedBox(width: 8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        displayRole,
                        style: const TextStyle(
                          color: Color(0xFF94A3B8), // text-slate-400
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 140,
                        child: Text(
                          displayUsername,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(width: 16),

              // Notification Bell
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // TODO: Show notifications
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: Color(0xFFCBD5E1), // text-slate-300
                      size: 20, // h-5 w-5
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // User Avatar
              Container(
                width: 32, // w-8
                height: 32, // h-8
                decoration: BoxDecoration(
                  color: const Color(0xFF9333EA), // bg-purple-600
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 16, // h-4 w-4
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
