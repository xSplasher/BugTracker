FROM node


WORKDIR /app/frontend_app
COPY package.json ./
COPY package-lock.json ./
COPY . ./

RUN npm install react-scripts@3.4.1 -g

RUN npm i
#RUN npm install
#RUN npm install react-scripts@3.4.1 -g

EXPOSE 3000
CMD ["npm", "run", "start"]