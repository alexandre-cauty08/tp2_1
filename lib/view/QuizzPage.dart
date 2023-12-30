import 'package:flutter/material.dart';
import '../providers/ProviderQuestions.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizzPage extends StatefulWidget
{
  const QuizzPage({Key? key, required this.title}) :super(key: key);
  final String title;

  @override
  State<QuizzPage> createState() => SomeQuizzPageState();
}
class SomeQuizzPageState extends State<QuizzPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 70,top: 6,left: 50,right: 50),
              child: Image.asset('images/maths.jpg',width: 300, height:200 ,fit: BoxFit.cover,) ,
            ),
            Container(
                width: 300,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Colors.white),
                ),
                child: Center(
                    child: Consumer<ProviderQuestions>(
                      builder:(context , provider, child){
                        return Text(
                          provider.questions[provider.questionNum].questionText,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16.0,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        );
                      },
                    ))),

            Container(
              padding: const EdgeInsets.only(top: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  Consumer<ProviderQuestions>(
                      builder: (context, provider, child) {
                        return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ButtonTheme(
                                minWidth: 60.0,
                                height: 35.0,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                                  ),
                                  onPressed: (){
                                    provider.compteur++;
                                    if(provider.compteur == 1){
                                      provider.checkAnswer(true, context);
                                    }
                                  }, child: const Text("Vrai", style: TextStyle(color: Colors.white),),
                                )
                            )
                        );
                      }),
                  Consumer<ProviderQuestions>(
                      builder:(context,provider,child) {
                        return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ButtonTheme(
                                minWidth: 60.0,
                                height: 35.0,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors.blue),
                                  ),
                                  onPressed: () {
                                    provider.compteur++;
                                    if (provider.compteur == 1) {
                                      provider.checkAnswer(false, context);
                                    }
                                  },
                                  child: const Text("Faux",
                                    style: TextStyle(color: Colors.white),),
                                )
                            ));
                      }),
                  Consumer<ProviderQuestions>(
                      builder: (context,provider,child){
                        return Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: ButtonTheme(
                                minWidth: 60.0,
                                height: 35.0,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                                  ),
                                  onPressed: (){
                                    provider.compteur++;
                                    if(provider.compteur > 0 && provider.questionNum < provider.questions.length)
                                    {
                                      provider.compteur = 0;
                                      provider.nextQuestion();
                                    }
                                    if(provider.fini == true)
                                    {
                                      Alert(
                                        context: context,
                                        title: "Fin du Quizz",
                                        desc: "Score : ${provider.total}/${provider.nbQuestion} !",
                                        buttons: [
                                          DialogButton(
                                              onPressed: (){
                                                Navigator.pop(context);
                                              },
                                          child: const Text(
                                            "Rejouer",
                                            style: TextStyle(color: Colors.white),),)
                                        ]).show();
                                      provider.reset();
                                    }
                                  }, child: const Icon(Icons.arrow_right),
                                )
                            ));
                      })
                ]
              )),
            Consumer<ProviderQuestions>(
                builder: (context,provider,child) {
                  return Center(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: provider.score,));
                })
          ])),
    );
  }
}
/*
(countClick > 0 && _questionNumber <questions.length) {
countClick = 0;
 */

AppBar _getAppBar() {
  return AppBar(
    title: const Text('Quizz',
      style: TextStyle(color: Colors.white),),
    centerTitle: true,
    backgroundColor: Colors.blue,
  );
}