import 'package:projectflutterbeta/screens/home/pang/callcenter.dart';
import 'package:projectflutterbeta/screens/home/pang/mapbangkok.dart';
import 'package:projectflutterbeta/screens/home/pang/mapcentral.dart';
import 'package:projectflutterbeta/screens/home/pang/mapeast.dart';
import 'package:projectflutterbeta/screens/home/pang/mapnorth.dart';
import 'package:projectflutterbeta/screens/home/pang/mapsouthern.dart';
import 'package:projectflutterbeta/screens/home/pang/mapwest.dart';

class Movie {
  String imageUrl;
  String title;
  String categories;
  String description;
  List<String> screenshots;
  String Pressed;
  Movie(
      {this.imageUrl,
      this.title,
      this.categories,
      this.description,
      this.screenshots,
      this.Pressed});
}

final List<Movie> movies = [
  Movie(
    imageUrl: 'assets/immages/photo/sector/bangkok.jpg',
    title: 'Bangkok',
    categories: 'Thailand',
    description:
        '\t\tBangkok is famous for the beauty of the temples. That there are many.It is also the largest source of trade. And has the largest weekend market (Chatuchak Weekend Market) in Asia as well Bangkok is a source of delicious restaurants for you. Many assortment From stalls to luxury restaurants There is also the best nightlife in Asia."',
    screenshots: [
      'assets/immages/photo/bangkok/KhaoSanRoad.jpg',
      'assets/immages/photo/bangkok/Chinatown.jpg',
      'assets/immages/photo/sector/bangkok.jpg',
      'assets/immages/photo/bangkok/KingPowerMahanakhon.jpg'
    ],
    Pressed: 'bangkok',
  ),
  Movie(
      imageUrl: 'assets/immages/photo/sector/center.jpg',
      title: 'Central',
      categories: 'Thailand',
      description:
          '\t\tThe central region has 19 provinces, each province being a little closer. Travel is easy , convenient, can travel to travel frequently. In addition, there are all forms of tourist attractions, including mountains , sea, waterfalls, land market, floating market, community way of art, culture And many others."Travel to various styles in the central region"',
      screenshots: [
        'assets/immages/photo/mapcaentral/1KiriwongTemple.jpg',
        'assets/immages/photo/mapcaentral/2ThungBuaDaengFloatingMarket.jpg',
        'assets/immages/photo/mapcaentral/5KhunInthapramunTemple.jpg',
        'assets/immages/photo/mapcaentral/9BangPuRecreationCenter.jpg',
      ],
      Pressed: 'center'),
  Movie(
      imageUrl: 'assets/immages/photo/sector/Eastern.jpg',
      title: 'Eastern',
      categories: 'Thailand',
      description:
          'In the eastern part There are hundreds of thousands of attractions such as Pattaya and Rayong. And the east coast from Chon Buri to Trat It is an interesting beach destination in Thailandland. Is an area surrounded by beautiful nature There are many islands and beaches. Full facilities. It is considered a pleasure and an impression that can be found here. In addition, in the eastern part There is still a source of ancient history. Visitors can visit many places as well.',
      screenshots: [
        'assets/immages/photo/mapeast/1Pattaya.jpg',
        'assets/immages/photo/mapeast/4KohKoodIsland.jpg',
        'assets/immages/photo/mapeast/7ThapLanNationalPark.jpg',
        'assets/immages/photo/mapeast/8ChaoLaoBeach.jpg'
      ],
      Pressed: 'eastern'),
  Movie(
      imageUrl: 'assets/immages/photo/sector/nost.jpg',
      title: 'Northern',
      categories: 'Thailand',
      description:
          'Tourism can be considered a part of life.\nThose who study hard or work hard and do not have enough time to relax, should plan to go on a trip. And what is better than inhaling fresh air Among the beautiful places, cool weather, and views of the fertile mountains. Including experiencing the unique lifestyles of people Therefore, we have compiled northern tourist destinations in different provinces to introduce for anyone wanting to follow in their travels.',
      screenshots: [
        'assets/immages/photo/n/doi_ang_khang01.jpg',
        'assets/immages/photo/n/DoiTungRoyalVilla.jpg',
        'assets/immages/photo/n/Phu_Chi_Fah10.jpg',
        'assets/immages/photo/n/Wat_Rong_Khun1.jpg'
      ],
      Pressed: 'nost'),
  Movie(
      imageUrl: 'assets/immages/photo/sector/Southern.jpg',
      title: 'Southern',
      categories: 'Thailand',
      description:
          '\t\tWhen talking about the southern region, everyone must think of the beautiful sea and white sand beaches,  which in fact there are many other types of southern tourist destinations.   And as an idea to travel to the south So we have compiled the southern tourist attractions to come together. Each place is very interesting. The atmosphere is good for a real vacation. Where are they going?',
      screenshots: [
        'assets/immages/photo/s/1_PromthepCape.jpg',
        'assets/immages/photo/s/2MaiKhaobeach.jpg',
        'assets/immages/photo/s/3SametNangSheViewpoint.jpg',
        'assets/immages/photo/s/4SimilanIslands.jpg'
      ],
      Pressed: 'southern'),
  Movie(
      imageUrl: 'assets/immages/photo/sector/west.jpg',
      title: 'Western',
      categories: 'Thailand',
      description:
          '\t\tBelieve that many people are looking forward to counting down the long holidays that are coming Some people may have a plan in their mind about where to go for this holiday,what to do, but some people don\'t have plans for this holiday.Therefore would like to volunteer to recommend tourist attractions in the western region As an option for everyone,including the Western region',
      screenshots: [
        'assets/immages/photo/mapwest/1ErawanNationalPark.jpg',
        'assets/immages/photo/mapwest/2NamtokPhaCharoen.jpg',
        'assets/immages/photo/mapwest/3SaiYokPark.jpg',
      ],
      Pressed: 'West'),
];

final List<String> myList = [
  'assets/images/shigatsu_wa_kimi_no_uso.jpg',
  'assets/images/plastic_memories.png',
  'assets/images/erased.jpg',
  'assets/images/seven_deadly_sins.jpg',
  'assets/images/cobra_kai.jpg',
];

final List<String> popular = [
  'assets/images/stranger_things.jpg',
  'assets/images/endgame.jpg',
  'assets/images/oitnb.jpg',
  'assets/images/daredevil.jpg',
];
