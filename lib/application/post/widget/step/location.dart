import 'package:country_code_picker/country_code_picker.dart';

import 'package:dnbapp/application/common/glass_container.dart';
import 'package:flutter/material.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';

import '../../post_state.dart';

class PostLocationStep extends StatelessWidget {
  final PostState state;

  const PostLocationStep({Key key, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassContainer(
        blur: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Where this video comme from ? let's show to the world that we are one",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            RaisedButton(
              onPressed: () {},
              child: CountryCodePicker(
                onChanged: (value) {
                  state.post.country = value;
                  state.hideNext.value = false;
                },
                showCountryOnly: true,
                initialSelection: "fr",
                showOnlyCountryWhenClosed: true,
                alignLeft: false,
                backgroundColor: Colors.transparent,
                barrierColor: Colors.black,
                boxDecoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                closeIcon: Icon(
                  Icons.close,
                  size: 30,
                  color: Theme.of(context).dividerColor,
                ),
                padding: EdgeInsets.all(15),
                textStyle: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: Colors.black),
                dialogTextStyle: Theme.of(context).textTheme.bodyText1,
                dialogBackgroundColor: Colors.transparent,
                favorite: ['fr', 'cz', 'be', 'de', 'nl', 'ru'],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Where do you want this video be show in the wolrd map ?",
                style: Theme.of(context).textTheme.subtitle2,
              ),
            ),
            RaisedButton(
              onPressed: state.pickerPostLocation,
              child: Text("Pick a location"),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
