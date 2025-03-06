import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const OceanRecreationApp());
}

// 主應用
class OceanRecreationApp extends StatelessWidget {
  const OceanRecreationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white70),
        ),
      ),
      home: HomePage(),
    );
  }
}

// 活動資料類
class Activity {
  final String title;
  final String location;
  final String imageUrl;

  Activity(
      {required this.title, required this.location, required this.imageUrl});
}

// 活動清單頁面
class HomePage extends StatelessWidget {
  final List<Activity> activities = [
    Activity(
      title: "浮潛探險",
      location: "綠島",
      imageUrl:
          "https://image.kkday.com/v2/image/get/w_960%2Cc_fit%2Cq_55%2Ct_webp/s1.kkday.com/product_269338/20250216143015_FN9F3/jpg",
    ),
    Activity(
      title: "衝浪挑戰",
      location: "墾丁",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_tmr30NM5o2iD2gdOdlvztTmPWQzZaMtwLA&s",
    ),
    Activity(
      title: "yeah",
      location: "花蓮",
      imageUrl:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ90wYA45ZAFaZag0MinC4X-eK6cYhsg3ABng&s",
    ),
    Activity(
      title: "賞鯨之旅",
      location: "花蓮",
      imageUrl: "https://source.unsplash.com/400x300/?whale",
    ),
    Activity(
      title: "賞鯨之旅",
      location: "花蓮",
      imageUrl: "https://source.unsplash.com/400x300/?whale",
    ),
    Activity(
      title: "賞鯨之旅",
      location: "花蓮",
      imageUrl: "https://source.unsplash.com/400x300/?whale",
    ),
    Activity(
      title: "賞鯨之旅",
      location: "花蓮",
      imageUrl: "https://source.unsplash.com/400x300/?whale",
    ),
    Activity(
      title: "賞鯨之旅",
      location: "花蓮",
      imageUrl: "https://source.unsplash.com/400x300/?whale",
    ),
    Activity(
      title: "賞鯨之旅",
      location: "花蓮",
      imageUrl: "https://source.unsplash.com/400x300/?whale",
    ),
  ];

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('海洋遊憩推薦'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: activities.length,
        itemBuilder: (context, index) {
          return ActivityCard(activity: activities[index]);
        },
      ),
    );
  }
}

// 活動卡片
class ActivityCard extends StatelessWidget {
  final Activity activity;

  const ActivityCard({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withAlpha(50), // 透明度調整
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5, // 增加陰影
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: activity.imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error, color: Colors.red),
          ),
        ),
        title: Text(
          activity.title,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(activity.location,
            style: const TextStyle(color: Colors.white70)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white),
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  ActivityDetailPage(activity: activity),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
          );
        },
      ),
    );
  }
}

// 活動詳情頁面
class ActivityDetailPage extends StatelessWidget {
  final Activity activity;

  const ActivityDetailPage({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(activity.title), backgroundColor: Colors.blueAccent),
      body: Column(
        children: [
          CachedNetworkImage(
            imageUrl: activity.imageUrl,
            width: double.infinity,
            height: 250,
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error, color: Colors.red),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.title,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 10),
                Text(
                  "地點: ${activity.location}",
                  style: const TextStyle(fontSize: 18, color: Colors.white70),
                ),
                const SizedBox(height: 20),
                const Text(
                  "這是一個美麗的海洋活動推薦，你可以在這裡享受大自然的奇觀！",
                  style: TextStyle(fontSize: 16, color: Colors.white54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
