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
