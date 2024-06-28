import { Controller, Get, Post, Body, Param, Put, Delete } from '@nestjs/common';
import { PostService } from './post.service';
import { Post as PostEntity } from './post.entity';

@Controller('posts')
export class PostController {
  constructor(private readonly postsService: PostService) {}

  @Get()
  findAll(): PostEntity[] {
    return this.postsService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string): PostEntity {
    return this.postsService.findOne(+id);
  }
}
