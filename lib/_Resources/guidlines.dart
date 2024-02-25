import 'package:deaf_and_project/_Resources/parallax_swiper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class guidlines  extends StatefulWidget {
  const guidlines ({Key? key}) : super(key: key);

  @override
  State<guidlines> createState() => _guidlinesState();
}

class _guidlinesState extends State<guidlines> {

  static const images = <String>[
    'assets/main_images/about us.jpg',
    'assets/main_images/about us.jpg',
    'assets/main_images/about us.jpg',
    'assets/main_images/about us.jpg',
    'assets/main_images/about us.jpg',
    'assets/main_images/about us.jpg',
    'assets/main_images/about us.jpg',
  ];
  static const customTexts = [
    'Delhi',
    'Hyderabad',
    'Chennai',
    'Bangalore',
    'Kerala',
    'Ahmedabad',
    'Mumbai',
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Expanded(flex: 2, child: Container(color: Theme.of(context).brightness == Brightness.dark ? Colors.purple.shade500 : Colors.teal.shade500)),
            Expanded(child: Container(color: Theme.of(context).brightness == Brightness.dark ? Color(0xFF121212) : Colors.white)),
          ],
        ),
        Align(
          alignment: Alignment(0, 0.2),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.height / 1.2,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              elevation: 12,
              child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 200,
                          child: ParallaxSwiper(
                            // List of image URLs to display
                            images: images,
                            // Fraction of the viewport for each image
                            viewPortFraction: 0.85,
                            // Disable the background zoom effect
                            backgroundZoomEnabled: false,
                            // Disable the foreground fade effect
                            foregroundFadeEnabled: false,
                            customTexts: customTexts,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Guidelines for Parents",
                            style: GoogleFonts.alexandria(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20,left: 20,right: 20),
                          child: Text(
                            "Love, Support & Encouragement :",
                            style: GoogleFonts.alexandria(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
                          child: Text(
                            '\n\n'
                                '• At whatever stage your child is diagnosed with hearing loss or deafness, how you approach their deafness can impact their mental health and self-esteem.\n'
                                '•  It’s tempting for parents to fixate on helping their child develop language, but the National Deaf Children’s Society says while language is important, it is just as important to a child’s emotional health and wellbeing that they feel loved, supported and included regardless of how they communicate...\n'
                                '• Communication will come in time. Love and support are the basis for a good upbringing.'
                            ,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15,
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20,left: 20,right: 20),
                          child: Text(
                            " Deaf Role Models: ",
                            style: GoogleFonts.alexandria(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
                          child: Text(
                            '\n• Role-models are important to a child’s social-emotional development, and even more important when the child belongs to a minority group, such as being deaf. When children don’t have a role model they identify with, it can lead to a lack in confidence, or the child believing that their social and career options are limited\n'
                                '• Exposing deaf children to adult deaf role models is vital to their development. Raising and educating deaf children suggests that deaf children “benefit from seeing how deaf adults navigate the day-to-day in their world”.\n'
                                '•For deaf children, it’s empowering to see deaf adults succeeding in everyday situations. It often provides opportunities for the child to learn how to navigate uncomfortable conversations around deafness.'
                            ,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15,
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20,left: 20,right: 20),
                          child: Text(
                            "School Life :",
                            style: GoogleFonts.alexandria(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
                          child: Text(
                            '\n\n'
                                '• Although many deaf children thrive at school, it can be challenging. Whether your deaf child attends a mainstream or deaf school, there are a few ways to help support their development throughout their education.\n'
                                '•  Ask that your deaf child can sit close to the front where it’s easier to lipread and hearing aids are more likely to be in range.\n'
                                '• Provide teachers with an outline of your deaf child’s specific needs, such as how to get their attention, their communication challenges and preferences, and details of any technology they use'
                                '•Ask that your child’s teachers access training on how best to support deaf children in the classroom, such as facing the class when speaking, making sure the lighting is good, and turning on subtitles when showing videos'
                                '•Ensure teachers make deaf children feel comfortable to ask questions, and provide extra support or written materials if the child needs them '
                                '• Ask the school if they can provide a dedicated quiet space for your child to communicate with their friends at break times if the background noise of the playground is too overwhelming'
                                '• Pair your child up with a hearing buddy who can keep an eye out for them and check they’ve understood instructions, for example in PE, or during school outings'
                                '• '
                            ,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15,
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20,left: 20,right: 20),
                          child: Text(
                            "Mental Health :",
                            style: GoogleFonts.alexandria(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 20,left: 20,right: 20),
                          child: Text(
                            '\n\n'
                                '• Good mental health is an important part of every child’s development. There are many ways parents can promote positive mental health for a deaf child.\n'
                                '• Talk about emotions -> Being able to acknowledge and discuss emotions is the basis of positive mental health. Encourage deaf children to be open with their emotions by making scrapbooks or flashcards showing different emotions, and having a daily mood check-in. Even if children don’t yet understand the language, this will help them become comfortable with the concept of mental health\n'
                                '• Make them feel included -> Deaf people often experience feelings of loneliness and being left out. That’s why it’s important to ensure your deaf child is included in the home environment as much as possible. If a child has hearing siblings, make sure they’re educated about the best communication methods and are encouraged to use them, so the deaf child can have the same hearing experiences as them at home.'
                                '• Promote independence -> All children need encouragement to take on new challenges, but it’s especially important to praise and acknowledge a deaf child’s triumphs to help their confidence grow.Why not create an achievements board and ask your child to write one thing their proud of themselves for each week.'
                                '• Never apologise for their deafness -> Whether at school, or in public settings, never apologise for your child’s deafness. If you do, it will subconsciously impact their self-esteem. Teach them that it’s nothing to be sorry for, and educating others is the best way forward.'
                                '•Champion a positive outlook on deafness -> Allow deaf children to accept that their deafness is an important part of their identity. Help them learn to become confident, independent and able to overcome barriers, through education, support and interactions with positive role models. '
                            ,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15,
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ),

                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
        ),
      ],
    );
  }
}
