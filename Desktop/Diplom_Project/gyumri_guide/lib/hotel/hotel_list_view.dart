import 'package:flutter/material.dart';
import 'package:gyumri_guide/hotel/hotel_detail_page.dart';
import 'hotel_list_model.dart';
import 'hotel_theme.dart';
import 'raiting/raitingwidget.dart';

class HotelListView extends StatefulWidget {
  const HotelListView(
      {super.key,
      this.hotelData,
      this.callback,
      this.animation,
      this.animationController});

  final HotelListData? hotelData;
  final Function? callback;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  // ignore: library_private_types_in_public_api
  _HotelListViewState createState() => _HotelListViewState();
}

class _HotelListViewState extends State<HotelListView> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController!,
      builder: (context, child) {
        return FadeTransition(
          opacity: widget.animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - widget.animation!.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 8, bottom: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HotelDetailPage(
                        img: widget.hotelData!.imagePath,
                        hotelName: widget.hotelData!.titleTxt,
                        perNight: widget.hotelData!.perNight,
                        description: widget.hotelData!.description,
                        information: widget.hotelData!.information,
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(16.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.6),
                            offset: const Offset(4, 4),
                            blurRadius: 16)
                      ]),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            AspectRatio(
                              aspectRatio: 2,
                              child: Image.asset(
                                widget.hotelData!.imagePath,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              color: HotelTheme.buildLightTheme()
                                  .colorScheme
                                  .background,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 16, top: 8, bottom: 8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            widget.hotelData!.titleTxt,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 22),
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                widget.hotelData!.subTxt,
                                                style: TextStyle(
                                                    color: Colors.grey
                                                        .withOpacity(0.8),
                                                    fontSize: 14),
                                              ),
                                              const SizedBox(width: 4),
                                              Icon(
                                                Icons.location_on,
                                                size: 16,
                                                color:
                                                    HotelTheme.buildLightTheme()
                                                        .primaryColor,
                                              ),
                                              Expanded(
                                                  child: Text(
                                                '${widget.hotelData!.dist.toStringAsFixed(1)} km to city',
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey
                                                        .withOpacity(0.8)),
                                              ))
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 4),
                                            child: Row(
                                              children: <Widget>[
                                                RatingBar(
                                                  ratingWidget: RatingWidget(
                                                    full: Icon(
                                                      Icons.star_rate_rounded,
                                                      color: HotelTheme
                                                              .buildLightTheme()
                                                          .primaryColor,
                                                    ),
                                                    half: Icon(
                                                      Icons.star_half_rounded,
                                                      color: HotelTheme
                                                              .buildLightTheme()
                                                          .primaryColor,
                                                    ),
                                                    empty: Icon(
                                                      Icons.star_border_rounded,
                                                      color: HotelTheme
                                                              .buildLightTheme()
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                  onRatingUpdate: (value) {},
                                                  itemPadding: EdgeInsets.zero,
                                                  initialRating:
                                                      widget.hotelData!.rating,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemSize: 24,
                                                ),
                                                // Text(
                                                //   '${widget.hotelData!.reviews} Reviews',
                                                //   style: TextStyle(
                                                //       fontSize: 14,
                                                //       color: Colors.grey
                                                //           .withOpacity(0.8)),
                                                // )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 16, top: 8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '\$${widget.hotelData!.perNight}',
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          '/per night',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color:
                                                  Colors.grey.withOpacity(0.8)),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(16),
                              onTap: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFavorite
                                      ? Colors.red
                                      : HotelTheme.buildLightTheme()
                                          .primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
