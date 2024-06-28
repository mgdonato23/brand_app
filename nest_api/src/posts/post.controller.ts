import { Controller, Get, Post, Body, Param, Put, Delete } from '@nestjs/common';
import { PostService } from './post.service'; // Importa o serviço de posts
import { Post as PostEntity } from './post.entity'; // Importa a entidade Post

@Controller('posts') // Define o controlador para lidar com requisições na rota /posts
export class PostController {
  constructor(private readonly postsService: PostService) {} // Injeta o serviço de posts no construtor

  @Get() // Define um método GET para a rota base /posts
  findAll(): PostEntity[] { // Retorna todos os posts
    return this.postsService.findAll(); // Chama o método findAll() do serviço para obter todos os posts
  }

  @Get(':id') // Define um método GET para a rota /posts/:id, onde :id é um parâmetro dinâmico
  findOne(@Param('id') id: string): PostEntity { // Obtém um único post pelo ID
    return this.postsService.findOne(+id); // Chama o método findOne() do serviço para obter o post pelo ID convertido para número
  }
}
