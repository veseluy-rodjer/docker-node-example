FROM node

	# устанавливаем простой HTTP-сервер для статики
	# RUN npm install -g http-server
	RUN npm install -g @vue/cli

	# делаем каталог 'app' текущим рабочим каталогом
	WORKDIR /app

	# VOLUME /home/nikolay/Docker/pets/apps/frontend:/app

	# копируем оба 'package.json' и 'package-lock.json' (если есть)
	COPY package*.json ./

	# устанавливаем зависимости проекта
	RUN npm install

	# копируем файлы и каталоги проекта в текущий рабочий каталог (т.е. в каталог 'app')
	COPY . .

	# собираем приложение для production с минификацией
	# RUN npm run build

	# EXPOSE 8006:8080
	# CMD [ "http-server", "dist" ]
	CMD npm run serve



    #
	# RUN mkdir -p ./home/frontend
    #
	# WORKDIR ./home/frontend
    #
	# VOLUME ./apps/frontend:/home/frontend
    #
	# EXPOSE 8080
    #
	# CMD [ "npm run serve" ]
