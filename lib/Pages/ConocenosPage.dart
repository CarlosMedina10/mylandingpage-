import 'dart:html';

import 'package:EntrenaAPP/Blocs/bloc/landingpage_bloc.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sliding_card/sliding_card.dart';
import 'package:EntrenaAPP/Style/Style.dart';
import 'package:EntrenaAPP/Widget/RoundedButton.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../Style/Style.dart';



class ConocenosPage extends StatefulWidget {
  final bool isOnConocenos;
  ConocenosPage(this.isOnConocenos);
  @override
  _ConocenosPageState createState() => _ConocenosPageState();
}

class _ConocenosPageState extends State<ConocenosPage> with TickerProviderStateMixin {
SlidingCardController controller ;
  bool card1 =false;
  bool card2 = false;
  bool card3=false;
  bool card4=false;
  int numeroTarjetas=0;
  var cardIndex = 0;
  var cardIndex2 = 0;
  ScrollController scrollController;
  ScrollController scrollController2;

  AnimationController animationController;
  AnimationController animationController2;
  ColorTween colorTween;
  ColorTween colorTween2;
  CurvedAnimation curvedAnimation;
  CurvedAnimation curvedAnimation2;

  @override
  void initState() {
    super.initState();
  controller = SlidingCardController();
    scrollController = new ScrollController();
    scrollController2 = new ScrollController();
  }

   Widget _buildDocumentAttachmentWidget(
      BuildContext context, String titulo, fecha, int color,bool isMobile,isTablet) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      height: 37,
      color: Color.fromRGBO(255, 128, 0, 0.2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 3,
            color: Colors.orange,
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Transform.rotate(
              angle: 3.14 / 180 * 45,
              child: Icon(CommunityMaterialIcons.medal,
                  color: (color == 1)
                      ? Color.fromRGBO(239, 184, 16, 1)
                      : Color.fromRGBO(192, 192, 192, 1)),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: (isMobile || isTablet ) ? MediaQuery.of(context).size.width * 5/8 : MediaQuery.of(context).size.width * 2/8 ,
                child: Text(
                  '$titulo',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.orange[800],
                    fontWeight: FontWeight.w600,
                  ),
                 
                  maxLines: 1,
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "$fecha",
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.orange[600],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  Widget _buildFrontWidget(String text, bool isMobile,isTablet) {
    return Container(
       width: (isMobile||isTablet) ? MediaQuery.of(context).size.width*0.7 :  MediaQuery.of(context).size.width*0.5,
      padding: EdgeInsets.all(15),
        color: Color(0xff0A183D),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
               width: (isMobile||isTablet) ? MediaQuery.of(context).size.width*0.4 :  MediaQuery.of(context).size.width*0.2,
              child: Text(text,
                  style: TextStyle(
                      color: Colors.white,
                     fontSize:(isMobile) ? 12 : 14,
                      fontWeight: FontWeight.w700)),
            ),
            
          
            
          ],
        ));
  }

  

  Widget _buildInnerBottomWidget(String text, bool isMobile,isTablet) {
   return Container(
    margin: EdgeInsets.symmetric(horizontal:(isMobile||isTablet) ? 0 : MediaQuery.of(context).size.width*0.0125),
     width:(isMobile||isTablet) ?  MediaQuery.of(context).size.width*0.85 : MediaQuery.of(context).size.width*0.5,
      padding: EdgeInsets.all(12),
        color: Color(0xff1c3546),
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: (isMobile||isTablet) ? MediaQuery.of(context).size.width*0.7 :  MediaQuery.of(context).size.width*0.4,
              child: Text(text,
                  style: TextStyle(
                      color: Colors.white,
                     
                      fontSize:(isMobile) ? 12 : 14,
                      fontWeight: FontWeight.w500)),
            ),
            
          
            
          ],
        ));
  }
  Widget customFlexible(String text, String subText, var icon) {
    return Flexible(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              backgroundColor: Color(0xffF24854),
              radius: 32.0,
              child: Icon(icon, color: Colors.white, size: 28.0),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              text,
              style: ThemText.createText,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              subText,
              style: ThemText.howitworkDec,
            ),
          ],
        ),
      ),
    );
  }

  Widget customCheckBox(String text, bool value,){
    var deviceType = getDeviceType(MediaQuery.of(context).size);
bool isMobile = false;
bool isTablet = false;
switch(deviceType) {
  case DeviceScreenType.watch:
    isMobile=false;
    isTablet=false;
    break;
  case DeviceScreenType.desktop:
     isMobile=false;
     isTablet=false;
    break;
  case DeviceScreenType.tablet:
     isMobile=false;
     isTablet=true;
    break;
  case DeviceScreenType.mobile:
     isMobile=true;
     isTablet=false;
    break;
  case DeviceScreenType.Mobile:
    // TODO: Handle this case.
    break;
  case DeviceScreenType.Tablet:
    // TODO: Handle this case.
    break;
  case DeviceScreenType.Desktop:
    // TODO: Handle this case.
    break;
  case DeviceScreenType.Watch:
    // TODO: Handle this case.
    break;
}
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
         (isTablet || isMobile) ? Icon(Icons.check,color: Colors.orange,) : Checkbox(
              activeColor: Colors.orange, value: value, onChanged: (value) {}),
          SizedBox(
            width: 16.0,
          ),
          Container(
           
            width: (isMobile|| isTablet) ? MediaQuery.of(context).size.width*0.65 : MediaQuery.of(context).size.width*0.3,
            child: Text(
                text,
                style: TextStyle(
    color: Colors.white,
    fontSize: (isMobile) ? MediaQuery.of(context).size.width/35 : (isTablet) ? MediaQuery.of(context).size.width/60 : MediaQuery.of(context).size.width/76, 
    fontWeight: FontWeight.w600
  ),
                
                maxLines: 1,
              ),
          ),
        ],
      ),
    );
  }

  Widget customCard( img, bool isMobile,isTablet,{text}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
         
          decoration: BoxDecoration(
            
              borderRadius: BorderRadius.circular(16.0), color: Colors.teal),
          height: 
            (text!=null) ?
          (isMobile) ? 173 : (isTablet) ? (MediaQuery.of(context).size.height<500) ? 173 : MediaQuery.of(context).size.height/2.875 :  (MediaQuery.of(context).size.height<500) ? 228 :  MediaQuery.of(context).size.height/2.19 :
           (isMobile) ? 200 : (isTablet) ? (MediaQuery.of(context).size.height<500) ? 205 : MediaQuery.of(context).size.height/2.38  :  (MediaQuery.of(context).size.height<500) ? 266 : MediaQuery.of(context).size.height/1.877
          ,
          
          width:
          (text!=null) ?
           (isMobile) ? 173 : (isTablet) ?(MediaQuery.of(context).size.height<500) ? 173 : MediaQuery.of(context).size.height/2.875 : (MediaQuery.of(context).size.height<500) ? 228 : MediaQuery.of(context).size.height/2.19:
           (isMobile) ? 300 : (isTablet) ? (MediaQuery.of(context).size.height<500) ? 285 : MediaQuery.of(context).size.height/1.75 :  (MediaQuery.of(context).size.height<500) ? 362 : MediaQuery.of(context).size.height/1.38 ,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage(img),
            ),
          ),
        ),
        SizedBox(
          height: 16.0,
        ),
     (text!=null) ?  Text(
          text,
          style: ThemText.cardText,
        ) : Container(height: 1,)
      ],
    );
  }

  Widget customCircleAvtar( img,bool isMobile, isTablet) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 100.0,
          backgroundImage: AssetImage(img),
        ),
       
        
      ],
    );
  }
Widget _buildFotos(bool isMobile, isTablet) {
  List<String> listaNombres = ['Juan','Richard','Kilian','Adrian','Jonathan','Adrian','Carlos','Jandro'];
    return Container(

     alignment: Alignment.topCenter,
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 8,
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, position) {
          print(position);
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: customCard('images/${position+1}-min.jpg' ,isMobile,isTablet,text:'${listaNombres[position]}'),
            ),
            onHorizontalDragEnd: (details) {
              animationController = AnimationController(
                  vsync: this, duration: Duration(milliseconds: 500));
              curvedAnimation = CurvedAnimation(
                  parent: animationController, curve: Curves.fastOutSlowIn);
              // animationController.addListener(() {
              //   setState(() {
              //     currentColor = colorTween.evaluate(curvedAnimation);
              //   });
              // });

              if (details.velocity.pixelsPerSecond.dx > 0) {
                if (cardIndex > 0) {
                  cardIndex--;
                  // colorTween = ColorTween(begin:currentColor,end:appColors[cardIndex]);
                }
              } else {
                if (cardIndex < 7) {
                  cardIndex++;
                  // colorTween = ColorTween(begin: currentColor,
                  //     end: appColors[cardIndex]);
                }
              }
              setState(() {
                scrollController.animateTo((cardIndex) * 256.0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn);
              });

              // colorTween.animate(curvedAnimation);

              animationController.forward();
            },
          );
        },
      ),
    );
  }
  Widget _buildFotos2(bool isMobile,isTablet) {
 
    return Container(

      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 9,
        controller: scrollController2,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, position) {
          print(position);
          return GestureDetector(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:  customCard( "images/R${position+1}.PNG",isMobile,isTablet
                 ),
            ),
            onHorizontalDragEnd: (details) {
              animationController2 = AnimationController(
                  vsync: this, duration: Duration(milliseconds: 500));
              curvedAnimation2 = CurvedAnimation(
                  parent: animationController2, curve: Curves.fastOutSlowIn);
              // animationController.addListener(() {
              //   setState(() {
              //     currentColor = colorTween.evaluate(curvedAnimation);
              //   });
              // });

              if (details.velocity.pixelsPerSecond.dx > 0) {
                if (cardIndex > 0) {
                  cardIndex--;
                  // colorTween = ColorTween(begin:currentColor,end:appColors[cardIndex]);
                }
              } else {
                if (cardIndex < 7) {
                  cardIndex++;
                  // colorTween = ColorTween(begin: currentColor,
                  //     end: appColors[cardIndex]);
                }
              }
              setState(() {
                scrollController2.animateTo((cardIndex) * 256.0,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.fastOutSlowIn);
              });

              // colorTween.animate(curvedAnimation);

              animationController2.forward();
            },
          );
        },
      ),
    );
  }
  @override
  Widget build(BuildContext context) {


var deviceType = getDeviceType(MediaQuery.of(context).size);
bool isMobile = false;
bool isTablet = false;
switch(deviceType) {
  case DeviceScreenType.watch:
    isMobile=false;
    isTablet=false;
    break;
  case DeviceScreenType.desktop:
     isMobile=false;
     isTablet=false;
    break;
  case DeviceScreenType.tablet:
     isMobile=false;
     isTablet=true;
    break;
  case DeviceScreenType.mobile:
     isMobile=true;
     isTablet=false;
    break;
  case DeviceScreenType.Mobile:
    // TODO: Handle this case.
    break;
  case DeviceScreenType.Tablet:
    // TODO: Handle this case.
    break;
  case DeviceScreenType.Desktop:
    // TODO: Handle this case.
    break;
  case DeviceScreenType.Watch:
    // TODO: Handle this case.
    break;
} 
if (isMobile || isTablet)
            {
              BlocProvider.of<LandingpageBloc>(
                                                                          context)
                                                                      .add(WantMobileOrTablet(false,true,false));
            }
            if (!isMobile && !isTablet && widget.isOnConocenos)
            {
     BlocProvider.of<LandingpageBloc>(
                                                                          context)
                                                                      .add(WantIsDesktop(false, true, false));
            }

    var size = MediaQuery.of(context).size;
    print(size.height);
    print(size.width);
    return SingleChildScrollView(
      child: 
      
      
      Container(
        color: Color(0xff0A183D),
        child: Column(
          children: [
            //Home Music for everyone
            (isMobile) ?
            Container(
            
                height: (size.height>500) ? size.height*3/8 : 200,
                    width:  size.width,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Image(
                        image: AssetImage("images/Conocenos.png"),
                      ),
                    ),
                  ) : Container(),
            Container(
              height: (isMobile) ? (size.height>500) ? size.height*4/8 : 250 : (size.height>500) ? size.height : 500,
              width: size.width,
           
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                     width: (isMobile==false) ? (isTablet==false) ? size.width/2 : size.width*5/8 : size.width,
                    child: Column(
                      mainAxisAlignment: (isMobile) ? MainAxisAlignment.start : MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                      
                          padding: EdgeInsets.only(left:size.width * 0.05,top: (isMobile) ? size.height*0.05 : 0),
                          alignment: Alignment.centerLeft,
                          width: (isMobile==false) ? (isTablet==false) ? size.width / 2 : size.width*5/8 : size.width,
                          child: Column(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "CONOCE QUIÉN ",
                                style: TextStyle(
    color: Colors.white,
    fontSize: size.width/22.76,
    fontWeight: FontWeight.w700,
  ) ,
                              ),
                              Text(
                                "ESTÁ DETRÁS DE",
                                style: TextStyle(
    color: Colors.white,
    fontSize: size.width/22.76,
    fontWeight: FontWeight.w700,
  ) ,
                              ),
                              Text(
                                "ENTRENAAPP",
                            
                                 style: TextStyle(
    color: Colors.white,
    fontSize: size.width/22.76,
    fontWeight: FontWeight.w700,
  ) ,
                              ),
                              SizedBox(height:10),
                        Container(
                          width: size.width/8,
                          child: Divider(color:Colors.orange,thickness: 1.0,)),
                            ],
                          ),
                        ),
                        SizedBox(height:10),
                        Container(
                       
                           padding: EdgeInsets.only(left:size.width * 0.05,right: size.width * 0.03),
                            width: (isMobile==false) ? (isTablet==false) ? size.width / 2 : size.width*5/8 : size.width,
                            alignment: Alignment.center,
                            child: Wrap(
                              children: [
                                Text(
                                  "Si eres curioso por naturaleza y quieres poner nombre y cara al encargado de conseguir tu mejor versión, ¡ponte cómodo y conócenos!",
                                  style: TextStyle(
    color: Colors.white,
    fontSize: (isMobile) ? 12 : (isTablet) ? 14 : 16,
    fontWeight: FontWeight.w500,
    letterSpacing: (isMobile) ? null : (isTablet) ? 0.5 : 1.0, 
  ),
                                ),
                              ],
                            )),
                  //       Container(
                  //         height: size.height*0.3,
                  //          width: (isMobile==false) ? (isTablet==false) ? size.width / 2 : size.width*5/8 : size.width,
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.center,
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: [
                  //             Container(
                  //   width:(isMobile || isTablet) ? size.width*4/16 : size.width/6,
                  //   alignment: Alignment.center,
                  //   child: Image(
                  //           image:  AssetImage("images/1.png"),
                  //   ),
                  // ),
                  //              Container(
                  //    width:(isMobile || isTablet) ? size.width*4/16 : size.width/6,
                  //   alignment: Alignment.center,
                  //   child: Image(
                  //           image:  AssetImage("images/2.png"),
                  //   ),
                  // ),
                  //           ],
                  //         ),
                  //       ),
                      ],
                    ),
                  ),
               (!isMobile) ?
                  Container(
                    width:  (isTablet==false) ? size.width / 2 : size.width*3/8,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Image(
                        image: (isTablet) ?  AssetImage("images/Conocenos.png") : AssetImage("images/Conocenos.png"),
                      ),
                    ),
                  ) : Container(), 
                ],
              ),
            ),

            //Unlimited Access
            Container(
               padding:
                              const EdgeInsets.symmetric(horizontal: 32.0),
              height: 
              (isMobile || isTablet) ?
              (size.height>500) ? size.height*1.5 : 750 :
                   (size.height>500) ? size.height : 500 
              ,
              width: size.width,
              color: Colors.white,
              child: Row(
                children: [
                  Container(
                     
                      width: (isMobile || isTablet) ? size.width-64 :  size.width*2 / 5 ,
                    child: Column(
                      crossAxisAlignment:  CrossAxisAlignment.start ,
                      mainAxisAlignment: (isMobile||isTablet) ? MainAxisAlignment.start : MainAxisAlignment.center,
                      children: [
                        (isMobile||isTablet) ? SizedBox(height:30) : SizedBox(height:0),
                        FittedBox(
                                                child: Text(
                                                  "Hola, soy Carlos Medina...\n",
                                                  maxLines: 1,
                                                  style: TextStyle(
    color: Color(0xff0A183D),
    fontSize: (isMobile) ? size.width/20 : (isTablet) ? size.width/30 : size.width/65,
    fontWeight: FontWeight.w800,  
  ),
                                                ),
                        ),
                        Container(
                          
                  
                    child: Text(
                      "Un apasionado del deporte repleto de energía desde que nací.",
                      style:  TextStyle(
    color: Color(0xff0A183D),
    fontSize: (isMobile) ? 12 : (isTablet) ? 14 : 14.0, 
  
    fontWeight: FontWeight.w700,
  ),
                    ),
                  ) ,
           Container(
                          
                  
                    child: Text(
                      "Mi primer contacto con el gimnasio fue a la temprana edad de 16 años, un mundo que me ha ayudado a ser una persona muy disciplinada en todo lo que hago. \nTras varios años de entrenamiento y progreso progresivo fui avanzando, hasta llegar a competir al más alto nivel como integrante de la selección Española de culturismo natural ganando el campeonato del mundo a mis 24 años. \nMi mayor motivación es aplicar la ciencia junto con más de una década de experiencia en el sector del fitness para mejorar la salud de las personas, siempre fiel a mis principios y de manera natural.",
                      style:  TextStyle(
    color: Color(0xff0A183D),
    fontSize: (isMobile) ? 12 : (isTablet) ? 14 : 14.0, 

    fontWeight: FontWeight.w500,
  ),
                    ),
                  ) ,
                  SizedBox(
                      height: 12,
                    ),
                    Text(
                      "PALMARÉS DEPORTIVO",
                      style: TextStyle(
                        color: Color.fromRGBO(3, 9, 40, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    _buildDocumentAttachmentWidget(
                        context, "Campeón del mundo WNBB", '10/10/2018', 1,isMobile,isTablet),
                    _buildDocumentAttachmentWidget(
                        context, "Campeón del Open Warriors", '05/09/2019', 1,isMobile,isTablet),
                    _buildDocumentAttachmentWidget(
                        context, "Campeón de España AECN", '19/09/2019', 1,isMobile,isTablet),
                    _buildDocumentAttachmentWidget(
                        context, "Subcampeón del mundo WNBB", '02/10/2019', 2,isMobile,isTablet), 
                      (isMobile||isTablet)  ?  Container(
                     height:  (isMobile) ? (size.height<500) ? 200 : size.height*0.4 : (size.height<500) ? 300 :  size.height * 0.6,
                    width:  size.width ,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Image(
                        image: AssetImage("images/Conocenos2.png"),
                      ),
                    ),
                  ) : Container(),
                      
                      ],
                    ),
                  ),
               (isMobile||isTablet) ? Container() :  Container(
                    
                    width:  size.width*3 / 5-64 ,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32),
                      child: Image(
                        image: AssetImage("images/Conocenos2.png"),
                      ),
                    ),
                  )
                ],
              ),
            ),
        
            
          Container(
              alignment: Alignment.center,
              height: (size.height<500) ? 500 : size.height,
              width: size.width,
              color: Color(0xff0A183D),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 36.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: size.width/2,
                              child: Text(
                                "PREPARACIÓN PROFESIONAL",
                                style: TextStyle(
    color: Colors.white,
    fontSize: (isMobile) ? size.width/20 : (isTablet) ? size.width/25 :  size.width/30,   
    fontWeight: FontWeight.w600,
    letterSpacing: 0.75,
  ),
  
                              ),
                            ),
                           Text(
                              "ONE-ON-ONE",
                              style: TextStyle(
    color: Colors.white,
     fontSize: (isMobile) ? size.width/20 : (isTablet) ? size.width/25 :  size.width/30,  
    fontWeight: FontWeight.w600,
    letterSpacing: 0.75,
  ),
  
                            ),
                            SizedBox(
                              height: 18.0,
                            ),
                           
                        Container(
                          width: size.width/8,
                          child: Divider(color:Colors.orange,thickness: 1.0,)),
                           SizedBox(height:18),
                             Text(
                               "Para solicitar una plaza en mi equipo y disponer de un asesoramiento y seguimiento mas personal no dudes en ponerte en contacto conmigo. Pondré mis ganas y años de experiencia a tu servicio para que progreses de la forma mas eficiente.",
                               style:TextStyle(
    color: Colors.white,
    fontSize: (isMobile) ? size.width/40 : (isTablet) ? size.width/50 :  size.width/60,  
    fontWeight: FontWeight.w600
  ),
                             ),
                            
                            SizedBox(
                              height: 25,
                            ),
                            
                            RoundedButton(
                              color: Colors.white,
                              textColor: Color(0xff0A183D),
                              textTitle: 'Solicitar información',
                              isMobile: isMobile,
                              isTablet: isTablet,
                            ),
                          (isMobile) ? Row(
                            children: [
                              Container(
                    height: (size.height<500) ? 200 :  size.height/3,
                    width:size.width/3,
                    alignment: Alignment.center,
                    child: Image(
                                image:  AssetImage("images/_DSC4000.jpg"),
                    ),
                  ),
                  SizedBox(
                    width:size.width/12
                  ),
                   Container(
                    height: (size.height<500) ? 200 :  size.height/3,
                    width:size.width/3,
                    alignment: Alignment.center,
                    child: Image(
                                image:  AssetImage("images/B99A0068.JPG"),
                    ),
                  ),
                            ],
                          ) : Container (),
                          ],
                        ),
                      ),
                    ),
                  ),
               (!isMobile) ? Container(
                    width:size.width/3,
                    alignment: Alignment.center,
                    child: Image(
                            image:  AssetImage("images/_DSC4000.jpg"),
                    ),
                  ) : Container (),
                      
                  
                ],
              ),
            ),
           
            Container(
              height: 
              (isMobile) ? 
               (size.height<500) ? 600 : size.height * 1.20 :
               (isTablet) ? 
                (size.height<500) ? 600 : size.height * 1.20 :
              (size.height<500) ? 800 : size.height * 1.60,
              width: size.width,
              color: Colors.white,
              child: 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex:  1,
                      
                      child: Container(
                          child: Column(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Algunos casos de éxito",
                            style: TextStyle(
    color: Color(0xff0A183D),
    fontSize: (isMobile) ? size.width/12.5 : (isTablet) ? size.width/17.5 : size.width/25, 
    fontWeight: FontWeight.w700, 
  ),
                          ),
                          SizedBox(height:20),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              "“Los clientes satisfechos son la mejor publicidad para una empresa”",
                              style: TextStyle(
    color: Color(0xff0A183D),
    fontSize: (isMobile) ? 12 : (isTablet) ? 14 : 16.0,
    letterSpacing: 2.75,
  ),
                            ),
                          )
                        ],
                      )),
                    ),
                    Expanded(
                      flex:  4,
                      child: 
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height:(isMobile) ? (size.height<500) ? 240 : size.height*0.48 : (isTablet) ? (size.height<500) ? 240 : size.height*0.48 : (size.height<500) ? 320 : size.height*0.64,
                              child: _buildFotos(isMobile,isTablet)),
                            SizedBox(height:0),
                            Container(
                               height:(isMobile) ? (size.height<500) ? 240 : size.height*0.48 : (isTablet) ? (size.height<500) ? 240 : size.height*0.48 : (size.height<500) ? 320 : size.height*0.64,
                              child: _buildFotos2(isMobile, isTablet)),
                          ],
                        ),
                      )
                      // Container(
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //     children: [
                      //       Flexible(
                      //           flex: 1,
                      //           child:
                      //               customCard('Soul Music', 'images/pic2.jfif')),
                      //       Flexible(
                      //           flex: 1,
                      //           child: customCard(
                      //               'Live Concerts', 'images/pic3.jfif')),
                      //       Flexible(
                      //           flex: 1,
                      //           child: customCard('Dj Sets', 'images/pic4.jfif')),
                      //       Flexible(
                      //           flex: 1,
                      //           child: customCard(
                      //               'Live Streems', 'images/pic5.jfif')),
                      //     ],
                      //   ),
                      // ),
                    ),
                  ],
                ),
              ),
            ),

          
           
            //Footer
            Container(
              height: size.height * 0.60,
              width: size.width,
              color: Color(0xff0A183D),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        "Questions? Call 000-800-040-1843",
                        style: ThemText.footerText,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            footerText("FAQ"),
                            footerText("Investor Relations"),
                            footerText("Privacy"),
                            footerText("Speed Test"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            footerText("Help Centre"),
                            footerText("Jobs"),
                            footerText("Cookie Preferences"),
                            footerText("Legal Notices"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            footerText("Account"),
                            footerText("Ways to Watch"),
                            footerText("Corporate Information"),
                            footerText("EntrenaAPP Originals"),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            footerText("Media Centre"),
                            footerText("Terms of Use"),
                            footerText("Contact Us"),
                          ],
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: Text(
                        "EntrenaAPP India",
                        style: ThemText.footerText,
                      ),
                    ),
                    Center(
                      child: Text(
                        "© Created By Tushar Nikam",
                        style: ThemText.footerText,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget footerText(text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        text,
        style: ThemText.footerText,
      ),
    );
  }
}
