import 'package:flutter/material.dart';
import 'package:quizzler/components/buttons.dart';
import 'package:quizzler/components/questions.dart';
import 'package:vibration/vibration.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:quizzler/components/my_questions.dart';
import 'package:quizzler/Components/text_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0; // متغير للتنقل بين الاسئلة

  // متغير لمعرفة هل أجاب المستخدم اجابة خاطة
  // (في حال اجاب المستخدم إجابة خاطئة يتم تغيير حالة المتغير وعرض زر إعادة محاولة)
  bool hasError = false;

  bool isStarted = false; // متغير لمعرفة هل تم بدئ التحدي ام لا
  int time = 0; // متغير لتخزين الوقت المستغرق
  int minTime = 0; // متغير لتخزين اقل وقت مستغرق

  // دالة تعمل عند النقل على ازرار الاجابة وفحص صحة الاجابة
  void check(bool f) {
    setState(() {
      if (!(counter >= myQuestionsList.length)) {
        if (myQuestionsList[counter].isTrue != f) {
          Vibration.vibrate(duration: 500);
          hasError = true;
        }
        counter++;
      }
      if (counter == myQuestionsList.length) {
        if (time < minTime || minTime == 0) {
          minTime = time;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isStarted
          ? hasError
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: TextView(
                        text: "إجابة خاطئة",
                        fontSize: 32,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Buttons(
                      btnChild: const Text(
                        "محاولة مرة اخرى",
                        style: TextStyle(
                          color: Color(0xfffaf0e6),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      press: () {
                        setState(() {
                          hasError = false;
                          counter = 0;
                          time = 0;
                          myQuestionsList.shuffle();
                        });
                      },
                      width: 200,
                    ),
                  ],
                )
              : (counter >= myQuestionsList.length)
                  ? _resultAndRestart(context)
                  : Column(
                      children: [
                        myTimer(),
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 100,
                                child: Center(
                                  child: Text(
                                    "${counter + 1}/${myQuestionsList.length}",
                                    style: const TextStyle(
                                      color: Color(0xff800000),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Questions(
                                  questionsList: myQuestionsList[counter]),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Buttons(
                                    width: 50,
                                    press: () {
                                      check(false);
                                    },
                                    btnChild: const Icon(
                                      Icons.close,
                                      size: 28,
                                      color: Color(0xfffaf0e6),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Buttons(
                                    width: 50,
                                    press: () {
                                      check(true);
                                    },
                                    btnChild: const Icon(
                                      Icons.check,
                                      size: 28,
                                      color: Color(0xfffaf0e6),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    )
          : startQuizzler(),
      appBar: myAppBar(),
      backgroundColor: const Color(0xfffaf0e6),
    );
  }

  Column startQuizzler() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: TextView(
            text: "Quizzler مرحباً بك في",
            fontSize: 32,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Buttons(
          btnChild: const Text(
            "بداء التحدي",
            style: TextStyle(
              color: Color(0xfffaf0e6),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          press: () {
            setState(() {
              isStarted = true;
              myQuestionsList.shuffle();
            });
          },
          width: 200,
        ),
      ],
    );
  }

  Container myTimer() {
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child:
          TimerBuilder.periodic(const Duration(seconds: 1), builder: (context) {
        time++;
        return ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
            color: Colors.white,
            child: Text(
              time.toString(),
              style: TextStyle(
                color: (time < 30)
                    ? Colors.green
                    : (time >= 30 && time <= 60)
                        ? Colors.orangeAccent
                        : Colors.red,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }),
    );
  }

  Padding _resultAndRestart(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const TextView(
            text: "! ممتاز",
            fontSize: 32,
          ),
          const SizedBox(
            height: 30,
          ),
          TextView(
            text: "الوقت المستغرق : $time",
            fontSize: 22,
          ),
          const SizedBox(
            height: 20,
          ),
          TextView(
            text: "اقل وقت مستغرق : $minTime",
            fontSize: 22,
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 50,
            child: Buttons(
              width: 200,
              btnChild: const Text(
                "إعادة بداء",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              press: () {
                setState(() {
                  counter = 0;
                  hasError = false;
                  time = 0;
                  myQuestionsList.shuffle();
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color(0xff800000),
      title: const Text(
        "Quizzler",
        style: TextStyle(
          color: Color(0xfffaf0e6),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
