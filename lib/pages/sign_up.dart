import 'package:flutter/material.dart';
import 'package:work/pages/WelcomeScreen.dart';

void main() => runApp(const SignUpApp());

//
class SignUpApp extends StatelessWidget {
  const SignUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const SignUpScreen(),
        '/welcome': (context) => const WelcomeScreen(),
      },
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: const Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

////////////

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _passwordTextController = TextEditingController();
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _usernameTextController = TextEditingController();
  final _genderTextController = TextEditingController();

  double _formProgress = 0;

  void _updateFormProgress() {
    var progress = 0.0;
    final controllers = [
      _firstNameTextController,
      _lastNameTextController,
      _genderTextController,
      _usernameTextController,
      _passwordTextController
    ];

    for (final controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  void _showWelcomeScreen() {
    Navigator.of(context).pushNamed('/welcome');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Form(
          onChanged: _updateFormProgress,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedProgressIndicator(value: _formProgress),
              Text('Регистрация', style: Theme.of(context).textTheme.headline4),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _firstNameTextController,
                  decoration: const InputDecoration(hintText: 'Имя'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _lastNameTextController,
                  decoration: const InputDecoration(hintText: 'Фамилия'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _usernameTextController,
                  decoration: const InputDecoration(hintText: 'Логин'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passwordTextController,
                  decoration: const InputDecoration(hintText: 'Придумайте пароль'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _genderTextController,
                  decoration: const InputDecoration(hintText: 'Муж/Жен'),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                        return states.contains(MaterialState.disabled)
                            ? null
                            : Colors.white;
                      }),
                  backgroundColor: MaterialStateProperty.resolveWith(
                          (Set<MaterialState> states) {
                        return states.contains(MaterialState.disabled)
                            ? null
                            : Colors.blue;
                      }),
                ),
                onPressed: _formProgress == 1 ? _showWelcomeScreen : null,
                child: const Text('Зарегистрироваться'),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class AnimatedProgressIndicator extends StatefulWidget {
  final double value;

  const AnimatedProgressIndicator({super.key,
    required this.value,
  });

  @override
  State<StatefulWidget> createState() {
    return _AnimatedProgressIndicatorState();
  }
}

class _AnimatedProgressIndicatorState extends State<AnimatedProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;
  late Animation<double> _curveAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    final colorTween = TweenSequence([
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.red, end: Colors.orange),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.orange, end: Colors.yellow),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.yellow, end: Colors.green),
        weight: 1,
      ),
    ]);

    _colorAnimation = _controller.drive(colorTween);
    _curveAnimation = _controller.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.animateTo(widget.value);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) => LinearProgressIndicator(
        value: _curveAnimation.value,
        valueColor: _colorAnimation,
        backgroundColor: _colorAnimation.value?.withOpacity(0.4),
      ),
    );
  }

}
