FROM node:14

COPY . /app

WORKDIR /app/backend

RUN npm install

EXPOSE 8080 #Must be exposed to direct API request to backend application

WORKDIR /app/frontend
RUN npm install
RUN npm run build
#EXPOSE 3000     #even when not exposed, frontend still works. Exposed port needed only by external traffic

WORKDIR /app/backend
CMD ["sh", "-c", "npm run start & cd /app/frontend && npm run start"]
