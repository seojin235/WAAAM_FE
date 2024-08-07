import 'package:bocket_test/CurationPage/RandomCuration.dart';
import 'package:bocket_test/Folder_page/folder_home_page.dart';
import 'package:bocket_test/WriteContent/PreWrite.dart';
import 'package:bocket_test/WriteContent/ReviewContent.dart';
import 'package:bocket_test/home_page/main_page.dart';
import 'package:bocket_test/upload_page/camera_view.dart';
import 'package:bocket_test/upload_page/image_upload.dart';
import 'package:flutter/material.dart';
import '../my_page/MyPage.dart';

class BottomBar extends StatelessWidget {

  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  BottomBar({
    required this.selectedIndex,
    required this.onItemTapped,
  });


  void _showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor:Colors.black.withOpacity(0),
      builder: (context) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 102,
              child: Padding(
                padding: const EdgeInsets.only(left: 33, right: 33, bottom: 20, top: 20),
                child: Container(
                  width: 212,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20), // 모달 상단에 둥근 모서리 적용
                  ),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,

                        ),
                        onPressed: () {
                          Navigator.pop(context); // 모달 닫기
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>CameraView()),
                          );// 다른 작업 수행
                        },
                        child: Row(
                          children: [
                            Image.asset('assets/image/camera.png',width: 24, height: 24,),
                            SizedBox(width: 18,),
                            Text('촬영하기',style: TextStyle(color: Colors.black,fontSize: 14,),),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,

                        ),
                        onPressed: () {
                          Navigator.pop(context); // 모달 닫기
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>ImageUpload()),
                          );
                        },
                        child: Row(
                          children: [
                            Image.asset('assets/image/album.png',width: 24, height: 24,),
                            SizedBox(width: 18,),
                            Text('앨범에서 불러오기',style: TextStyle(color: Colors.black,fontSize: 14,),),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0,

                        ),
                        onPressed: () {
                          Navigator.pop(context); // 모달 닫기
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>PreWrite()),
                          );
                        },
                        child: Row(
                          children: [
                            Image.asset('assets/image/write.png',width: 24, height: 24,),
                            SizedBox(width: 18,),
                            Text('직접 작성하기',style: TextStyle(color: Colors.black,fontSize: 14,),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 84,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
           // 0 box-shadow: 0px 4px 8.4px 0px rgba(0, 0, 0, 0.02);
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset('assets/image/home_default.png', width: 48,height: 48,),
              activeIcon: Image.asset('assets/image/home_default.png',width: 48,height: 48,),
              label: '', // 항목의 레이블 추가
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/image/review_default.png', width: 48,height: 48,),
              activeIcon: Image.asset('assets/image/review_default.png',width: 48,height: 48,),
              label: '', // 항목의 레이블 추가
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/image/plus.png', width: 48,height: 48,),
              label: '', // 레이블이 필요 없는 항목은 빈 문자열로 지정
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/image/folder_default.png', width: 48,height: 48,),
              activeIcon: Image.asset('assets/image/folder_default.png',width: 48,height: 48,),
              label: '', // 항목의 레이블 추가
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/image/mypage_default.png', width: 48,height: 48,),
              activeIcon: Image.asset('assets/image/mypage_default.png',width: 48,height: 48,),
              label: '', // 항목의 레이블 추가
            ),
          ],
          currentIndex: selectedIndex,
          onTap: (index) {
            switch (index){
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>MainPage()),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>RandomCuration()),
                );
                break;
              case 2:
                _showModal(context); // 가운데 버튼을 누를 때 모달 창 띄우기
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>FolderMainPage()),
                );
                break;
              case 4:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>MyPage()),
                );
                break;
            }
          },
        ),
    );
  }
}
