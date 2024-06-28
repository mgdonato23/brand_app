import { Module } from '@nestjs/common';
import { PostService } from './post.service'; // Importa o serviço PostService
import { PostController } from './post.controller'; // Importa o controlador PostController

@Module({
  controllers: [PostController], // Define os controladores utilizados pelo módulo, no caso, apenas PostController
  providers: [PostService], // Define os provedores de serviços utilizados pelo módulo, no caso, apenas PostService
})
export class PostModule {} // Define a classe PostModule como um módulo em NestJS
