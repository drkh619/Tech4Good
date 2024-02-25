import 'package:flutter/material.dart';
import 'package:flutter_fancy_container/flutter_fancy_container.dart';
import 'package:google_fonts/google_fonts.dart';

class ettiquettes extends StatefulWidget {
  const ettiquettes({Key? key}) : super(key: key);

  @override
  State<ettiquettes> createState() => _ettiquettesState();
}

class _ettiquettesState extends State<ettiquettes> {
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
                        Image.asset(
                          'assets/main_images/about us.jpg',
                          height: 150,
                          width: 150,
                        ),
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Etiquettes",
                            style: GoogleFonts.alexandria(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              fontSize: 28.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                             "*American sign language (ASL) is an entirely different language, with a unique syntax of its own",
                            style: GoogleFonts.alexandria(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                              ),
    ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            '-> Speech reading (lip reading) is difficult for people who are Deaf if their first language is ASL, because the majority of sounds in some languages are formed inside the mouth, and it is hard to speech read a second language\n'
                            ,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15,
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            "* People who are hard of hearing may communicate verbally",
                            style: GoogleFonts.alexandria(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            '-> They use some hearing but may rely on amplification, captions, and/or seeing the speaker’s lips to communicate effectively\n'
                            ,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15,
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            "*There is a range of communication preferences + styles among people with hearing loss that can’t be explained briefly.",
                            style: GoogleFonts.alexandria(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            '-> It is helpful to note that the majority of late deafened adults do not communicate with sign language, do use verbal language, and may be candidates for writing and assistive listening devices to help improve communication. People with cochlear implants, like other people with hearing impairments, will usually inform you what works best for them\n'
                            ,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15,
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            "*When the exchange of information is complex, the best + appropriate way to communicate with a signer is through a qualified sign-language interpreter",
                            style: GoogleFonts.alexandria(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            '->For a simple interaction, writing back and forth is usually okay\n'
                            ,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15,
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            "*Follow the person’s cues to find out if they prefer sign language, gesturing, writing, or speaking",
                            style: GoogleFonts.alexandria(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            '->If you have trouble understanding the speech of a person who is deaf or hard of hearing, let them know\n'
                            ,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15,
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            "*Talk directly to the person, rather than to the interpreter.",
                            style: GoogleFonts.alexandria(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            '->When using a sign-language interpreter, look directly at the person who is deaf, and maintain eye contact to be polite, if possible.\n'
                            ,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15,
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            "If an issue affects a deaf or hard of hearing person,include them in the decisions about that issue.",
                            style: GoogleFonts.alexandria(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'People who are deaf need to be included in the decision-making process for issues that affect them; don’t decide for them'
                            ,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15,
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            "*Get the person’s attention respectfully",
                            style: GoogleFonts.alexandria(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            '->Before speaking to a person who is deaf or hard of hearing, make sure that you get their attention. Depending on the situation, you can extend your arm and wave your hand, tap their shoulder, or flicker the lights.\n'
                            ,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15,
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            "*Rephrase, rather than repeat, sentences that they don’t understand.",
                            style: GoogleFonts.alexandria(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            "*When talking, make sure they can see you well",
                            style: GoogleFonts.alexandria(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            '->Face the person while speaking. A quiet, well-lit room is most conducive to effective communication. If you are in front of the light source withyour back to it, the glare may obscure your face and make it hard for the person who is hard of hearing to speech read\n'
                            ,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15,
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            "*Speak clearly.",
                            style: GoogleFonts.alexandria(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            '->Most people who are hard of hearing count on watching people’s lips as they speak to help them understand. Avoid chewing gum, smoking, or obscuring your mouth with your hand while speaking\n'
                            ,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15,
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Text(
                            "*Do not shout",
                            style: GoogleFonts.alexandria(
                              color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            '->If the person uses a hearing aid, it will be calibrated to normal voice levels; your shout will just sound distorted\n'
                            ,
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15,
                                color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black),
                          ),
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






