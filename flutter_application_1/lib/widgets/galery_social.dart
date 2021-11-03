import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GalerySocial extends StatelessWidget {
  String? likeCount;
  String? commentCount;
  String? repostCount;
  Color? likeColor = Colors.red;
  Color? commentColor = Colors.green;
  Color? repostColor = Colors.blue;

  GalerySocial({
    String? likeCount,
    String? commentCount,
    String? repostCount,
  }) {
    this.likeCount = likeCount;
    this.commentCount = commentCount;
    this.repostCount = repostCount;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(16, 16, 37, 16),
          width: 295,
          height: 52,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // like
              Container(
                child: Row(
                  children: [
                    // logo
                    Container(
                      child: SvgPicture.asset('assets/svg_icon/like_icon.svg'),
                      width: 20,
                      height: 20,
                    ),
                    // count
                    Container(
                      child: Text(
                        likeCount.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: likeColor,
                        ),
                      ),
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                    ),
                  ],
                ),
              ),
              // comment
              Container(
                child: Row(
                  children: [
                    // logo
                    Container(
                      child:
                          SvgPicture.asset('assets/svg_icon/comment_icon.svg'),
                      width: 20,
                      height: 20,
                    ),
                    // count
                    Container(
                      child: Text(
                        commentCount.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: commentColor,
                        ),
                      ),
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                    ),
                  ],
                ),
              ),
              // repost
              Container(
                child: Row(
                  children: [
                    // logo
                    Container(
                      child:
                          SvgPicture.asset('assets/svg_icon/repost_icon.svg'),
                      width: 20,
                      height: 20,
                    ),
                    // count
                    Container(
                      child: Text(
                        repostCount.toString(),
                        style: TextStyle(
                          fontSize: 14,
                          color: repostColor,
                        ),
                      ),
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
