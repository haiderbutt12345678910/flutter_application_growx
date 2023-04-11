import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          color: Colors.white,
          height: 70,
        ),
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          child: Text(
            "Join Us!Lets Grow Together",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontSize: 26, color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: TextFormField(
                  minLines: 2,
                  maxLines: 2,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey,
                      border: InputBorder.none,
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey)),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(color: Colors.white),
                      hintText: "Enter your Email Here!"),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  flex: 1,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 40)),
                      onPressed: () {},
                      child: Text(
                        "Contact Us",
                        style: Theme.of(context).textTheme.titleMedium,
                      ))),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {},
              child: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset("Asset/webimages/fb.png"),
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            InkWell(
              onTap: () {},
              child: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset("Asset/webimages/utube.png"),
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            InkWell(
              onTap: () {},
              child: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset("Asset/webimages/tweet.png"),
              ),
            ),
            const SizedBox(
              width: 14,
            ),
            InkWell(
              onTap: () {},
              child: SizedBox(
                width: 50,
                height: 50,
                child: Image.asset("Asset/webimages/insta.png"),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.center,
          width: double.infinity,
          color: Colors.black,
          child: Text(
            "@2021GX.All rights reserved",
            style: Theme.of(context).textTheme.displaySmall,
          ),
        )
      ],
    );
  }
}
