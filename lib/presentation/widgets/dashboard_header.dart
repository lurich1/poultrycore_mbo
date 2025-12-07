import 'package:flutter/material.dart';

/// Presentation Widget - Dashboard Header
/// Matches the frontend FarmArchive design exactly
class DashboardHeader extends StatelessWidget {
  final TextEditingController? searchController;
  final String? username;
  final String? roleLabel;
  final bool showMenuButton;
  final VoidCallback? onMenuPressed;

  const DashboardHeader({
    super.key,
    this.searchController,
    this.username,
    this.roleLabel,
    this.showMenuButton = false,
    this.onMenuPressed,
  });

  @override
  Widget build(BuildContext context) {
    final displayUsername = username ?? 'User';
    final displayRole = roleLabel ?? 'Admin';
    final screenWidth = MediaQuery.of(context).size.width;
    final isVerySmall = screenWidth < 400;
    final isSmall = screenWidth < 600;

    return Container(
      height: 64, // Header height
      decoration: const BoxDecoration(
        color: Color(0xFF0F172A), // bg-slate-900
        border: Border(
          bottom: BorderSide(
            color: Color(0xFF1E293B),
            width: 1,
          ), // border-slate-800
        ),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isVerySmall ? 8 : (isSmall ? 16 : 24),
        vertical: 16,
      ),
      child: Row(
        children: [
          // Hamburger Menu Button (visible on mobile to open drawer)
          if (showMenuButton)
            Builder(
              builder: (builderContext) => IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Color(0xFFCBD5E1), // text-slate-300
                  size: 24,
                ),
                onPressed:
                    onMenuPressed ??
                    () {
                      // Use Scaffold.of to find the nearest Scaffold and open drawer
                      Scaffold.of(builderContext).openDrawer();
                    },
                tooltip: 'Open menu',
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ),
          if (showMenuButton) SizedBox(width: isVerySmall ? 4 : 8),
          // Search Bar (on the left) - Hide on very small screens
          if (!isVerySmall)
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

          if (!isVerySmall) SizedBox(width: isSmall ? 8 : 16),
          // Right side actions - Responsive layout
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // User Info - Hide text on very small screens, show only on larger screens
              if (!isVerySmall)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.people,
                      color: Color(0xFFCBD5E1), // text-slate-300
                      size: 18, // Slightly smaller
                    ),
                    SizedBox(width: isSmall ? 4 : 8),
                    if (!isSmall)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            displayRole,
                            style: const TextStyle(
                              color: Color(0xFF94A3B8), // text-slate-400
                              fontSize: 11,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            displayUsername,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                  ],
                ),

              SizedBox(width: isVerySmall ? 4 : 8),

              // Notification Bell
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // TODO: Show notifications
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    padding: EdgeInsets.all(isVerySmall ? 6 : 8),
                    child: const Icon(
                      Icons.notifications_outlined,
                      color: Color(0xFFCBD5E1), // text-slate-300
                      size: 20, // h-5 w-5
                    ),
                  ),
                ),
              ),

              SizedBox(width: isVerySmall ? 4 : 8),

              // User Avatar
              Container(
                width: isVerySmall
                    ? 28
                    : 32, // Slightly smaller on very small screens
                height: isVerySmall ? 28 : 32,
                decoration: BoxDecoration(
                  color: const Color(0xFF9333EA), // bg-purple-600
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: isVerySmall ? 14 : 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
