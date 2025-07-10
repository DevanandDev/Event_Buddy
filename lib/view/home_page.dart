import 'package:carousel_slider/carousel_slider.dart';
import 'package:event_buddy/constants/color_const.dart';
import 'package:event_buddy/constants/image_list.dart';
import 'package:event_buddy/constants/text_constants.dart';
import 'package:event_buddy/view/booking_page.dart';
import 'package:event_buddy/viewmodel/carousel_provider.dart';
import 'package:event_buddy/viewmodel/event_fetch_provider.dart';
import 'package:event_buddy/widgets/auth_widgets.dart';
import 'package:event_buddy/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchController = TextEditingController();
  final images = Carouselimages().imageUrls;

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () =>
          Provider.of<EventFetchProvider>(
            context,
            listen: false,
          ).fetchProvider(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        leading: Builder(builder: (context) {
          return IconButton(onPressed: (){
            Scaffold.of(context).openDrawer();
          }, icon: Icon(Icons.menu,color: ColorConsts.deepPurple,));
        },),
        title: text(
          text: TextConstants.appName,
          colors: ColorConsts.deepPurple,
          fontSize: 20,
          fontweights: FontWeight.bold,
        ),
      ),
      drawer: drawer(context), 
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: TextConstants.search,
                prefixIcon: Icon(Icons.search,color: ColorConsts.deepPurple,),
              ),
              onChanged: (value) {
                context.read<EventFetchProvider>().search(value);
              },
            ),
            const SizedBox(height: 22),
            Consumer<CarouselProvider>(
              builder: (context, value, child) {
                return CarouselSlider(
                  items:
                      images.map((path) {
                        return Builder(
                          builder: (context) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                path,
                                fit: BoxFit.fill,
                                width: double.infinity,
                              ),
                            );
                          },
                        );
                      }).toList(),
                  options: CarouselOptions(
                    height: 200,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    viewportFraction: 0.9,
                    onPageChanged: (index, reason) {
                      value.change(index);
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 12),
            Consumer<CarouselProvider>(
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(images.length, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: value.index == index ? 12 : 8,
                      height: value.index == index ? 12 : 8,
                      decoration: BoxDecoration(
                        color:
                            value.index == index
                                ? ColorConsts.purple
                                : ColorConsts.lightPurple,
                        shape: BoxShape.circle,
                      ),
                    );
                  }),
                );
              },
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(right: 200),
    
              child: text(
                text: 'Every Moments',
                fontSize: 20,
                fontweights: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Consumer<EventFetchProvider>(
                builder: (context, value, child) {
                  if (value.isloading) {
                    return const Center(child: CircularProgressIndicator());
                  }
    
                  if (value.eventDatas.isEmpty) {
                    return const Center(child: Text(TextConstants.noEvent));
                  }
    
                  return GridView.builder(
                    itemCount: value.filterEvent.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                        ),
                    itemBuilder: (context, index) {
                      final event = value.filterEvent[index];
                      return Stack(
                        children: [
                          Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(10),
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (ctx) => MyBooking(),
                                          ),
                                        );
                                      },
                                      child: Image.network(
                                        event.image,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        errorBuilder: (
                                          context,
                                          error,
                                          stackTrace,
                                        ) {
                                          return const Center(
                                            child: Icon(Icons.broken_image),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    event.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    maxLines: 12,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 120,
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(50, 30),
                                shape: CircleBorder(),
                                iconSize: 16,
                                iconColor: ColorConsts.purple,
                              ),
                              onPressed: () {},
                              label: Icon(Icons.favorite),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
