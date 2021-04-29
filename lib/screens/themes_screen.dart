import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:recipes_app/providers/theme_provider.dart';
import 'package:recipes_app/widgets/main_drawer.dart';

class ThemesScreen extends StatelessWidget {
  static final routName = '/ThemesScreen';
  buildRadioListTile({
    required ThemeMode themeVal,
    required String txt,
    IconData? icon,
    required BuildContext ctx,
  }) {
    return RadioListTile(
      value: themeVal,
      groupValue: Provider.of<ThemeProvider>(ctx).tm,
      onChanged: (newThemeVal) => Provider.of<ThemeProvider>(ctx, listen: false)
          .themeModeChange(newThemeVal),
      title: Text(txt),
      secondary: Icon(
        icon,
        color: Theme.of(ctx).buttonColor,
      ),
    );
  }

  buildListTile(BuildContext context, txt) {
    var primaryColor = Provider.of<ThemeProvider>(context).primaryColor;
    var accentColor = Provider.of<ThemeProvider>(context).accentColor;
    return ListTile(
      title: Text('Choose your $txt color'),
      trailing: CircleAvatar(
        backgroundColor: txt == 'primary' ? primaryColor : accentColor,
      ),
      onTap: () => showDialog(
        context: context,
        builder: (BuildContext ctx) => AlertDialog(
          elevation: 4,
          titlePadding: EdgeInsets.all(0),
          contentPadding: EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: txt == 'primary'
                  ? Provider.of<ThemeProvider>(ctx).primaryColor
                  : Provider.of<ThemeProvider>(ctx).accentColor,
              colorPickerWidth: 300,
              pickerAreaHeightPercent: 0.7,
              enableAlpha: false,
              displayThumbColor: true,
              showLabel: false,
              onColorChanged: (color) => Provider.of<ThemeProvider>(
                ctx,
                listen: false,
              ).onChange(
                color,
                txt == 'primary' ? 1 : 2,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Themes')),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  child: Text(
                    'Choose your ThemeMode',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                buildRadioListTile(
                  themeVal: ThemeMode.system,
                  txt: 'SystemDefault Theme',
                  icon: null,
                  ctx: context,
                ),
                buildRadioListTile(
                  themeVal: ThemeMode.light,
                  txt: 'Light Theme',
                  icon: Icons.wb_sunny_outlined,
                  ctx: context,
                ),
                buildRadioListTile(
                  themeVal: ThemeMode.dark,
                  txt: 'Dark Theme',
                  icon: Icons.nights_stay_outlined,
                  ctx: context,
                ),
                buildListTile(context, 'primary'),
                buildListTile(context, 'accent'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
