import 'package:Quotes/Components/hero_dialog_route.dart';
import 'package:Quotes/Models/quote.dart';
import 'package:Quotes/pages/quote_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key, required this.likedQuotes});

  final List<Quote> likedQuotes;

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  PreferredSizeWidget displayAppBar(List<Quote> likedQuotes) {
    return AppBar(
      backgroundColor: kPrimaryLighterDark,
      centerTitle: true,
      toolbarHeight: 100,
      elevation: 0,
      title: Text(
        'FAVORITES',
        style: GoogleFonts.getFont(
          'Montserrat',
          fontSize: 40,
          color: kSecondaryDark,
        ),
      ),
      leading: Builder(builder: (context) {
        return Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context, likedQuotes);
            },
            child: const Icon(
              Icons.home_filled,
              color: kSecondaryDark,
              size: 50,
            ),
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Quote> likedQuotes = widget.likedQuotes;

    return Scaffold(
      appBar: displayAppBar(likedQuotes),
      backgroundColor: kPrimaryDark,
      body: ListView.builder(
          itemCount: likedQuotes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: GestureDetector(
                onTap: () async {
                  List<Quote> quotes = await Navigator.of(context).push(
                        HeroDialogRoute(
                          builder: (context) {
                            return QuoteCard(
                              quote: likedQuotes.isNotEmpty
                                  ? likedQuotes[index]
                                  : Quote(
                                      author: 'Author Name', quote: 'Quote'),
                              likedQuotes: likedQuotes,
                            );
                          },
                        ),
                      ) ??
                      [];
                  setState(() {
                    likedQuotes = quotes;
                  });
                },
                child: Hero(
                  tag: 'quote by ${likedQuotes[index].author}',
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    color: kPrimaryDark,
                    child: Dismissible(
                      key: ValueKey<Quote>(likedQuotes[index]),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        setState(() {
                          likedQuotes[index].isLiked = false;
                          likedQuotes.remove(likedQuotes[index]);
                        });
                      },
                      background: const Padding(
                        padding: EdgeInsets.only(right: 18.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.delete,
                              size: 25,
                              color: kSecondaryDark,
                            ),
                          ],
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: kPrimaryLighterDark),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 32.0),
                          child: Row(
                            children: [
                              Text(
                                'BY',
                                style: GoogleFonts.getFont('Montserrat',
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Text(
                                  likedQuotes[index].author.toUpperCase(),
                                  style: GoogleFonts.getFont('Montserrat',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: kSecondaryDark),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
