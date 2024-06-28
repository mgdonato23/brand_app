import { Injectable, NotFoundException } from '@nestjs/common';
import { Post } from './post.entity'; // Importa a entidade Post

@Injectable()
export class PostService {
  // Dados simulados de posts (poderiam vir de um banco de dados real)
  private posts: Post[] = [
    {
      id: 1,
      title: 'Ferrari: A Cavalgada Italiana',
      body: 'Em 1929, em Maranello, na Itália, Enzo Ferrari, ex-diretor da Alfa Romeo, deu vida à sua ambição: a Ferrari. Mais do que uma montadora, a Ferrari se tornou um símbolo de esportividade, luxo e performance inigualável. O "Cavallino Rampante", símbolo da marca, evoca força e elegância, eternizando a paixão de Enzo pelas corridas.',
    },
    {
      id: 2,
      title: 'Lamborghini: O Touro Furioso de Sant\'Agata',
      body: 'Em 1963, na cidade italiana de Sant\'Agata Bolognese, Ferruccio Lamborghini, insatisfeito com sua Ferrari, decidiu criar sua própria obra-prima: a Lamborghini. Nascia assim uma rivalidade lendária, impulsionando a inovação e o design arrojado. O "Touro" furioso, símbolo da marca, representa a força bruta e a agressividade dos seus superesportivos.',
    },
    {
      id: 3,
      title: 'Porsche: A Alma Alemã em Cada Curva',
      body: 'Em 1931, em Stuttgart, na Alemanha, Ferdinand Porsche, o gênio por trás do lendário fusca, fundou a Porsche. Seus carros esportivos e de luxo são sinônimo de engenharia impecável e tecnologia de ponta. O "Cavalo de Esmalte", símbolo da marca, traduz a velocidade e a elegância que acompanham cada modelo.',
    },
    {
      id: 4,
      title: 'McLaren: Voando Baixo com a Gaivota',
      body: 'Em 1963, em Woking, na Inglaterra, Bruce McLaren, piloto neozelandês de Fórmula 1, deu vida à sua equipe e montadora. A McLaren se tornou um ícone de alta performance, tanto nas pistas quanto nas ruas. A "Gaivota", símbolo da marca, representa a liberdade e a velocidade que guiam seus carros esportivos.',
    },
    {
      id: 5,
      title: 'Bugatti: Luxo Extremo e Artesanal',
      body: 'Em 1909, em Molsheim, na França, Ettore Bugatti, um designer e engenheiro visionário, fundou a Bugatti. Seus carros são obras de arte sobre rodas, combinando luxo ultraluxuoso com desempenho de tirar o fôlego. O "Elefante", símbolo da marca, representa a força e a robustez que acompanham cada modelo artesanal.',
    },
    {
      id: 6,
      title: 'Volkswagen: O Carro do Povo que Conquistou o Mundo',
      body: 'Em 1937, em Wolfsburg, na Alemanha, o governo nazista fundou a Volkswagen com o objetivo de criar um "carro do povo". O fusca se tornou um símbolo mundial, mas a marca evoluiu para oferecer carros populares, acessíveis e confiáveis para todos os gostos. A "Volkswagen", símbolo da marca, representa a simplicidade e a acessibilidade que a consagraram.',
    },
    {
      id: 7,
      title: 'Fiat: A Italiana que se Fez Gigante',
      body: 'Em 1899, em Turim, na Itália, Giovanni Agnelli, um visionário da indústria automobilística, fundou a Fiat. Seus carros populares e compactos conquistaram o mundo com design italiano e tecnologia inovadora. A "FIAT", símbolo da marca, representa a Fabbrica Italiana Automobili Torino, um legado de tradição e qualidade.',
    },
    {
      id: 8,
      title: 'Chevrolet: O Sonho Americano em Quatro Rodas',
      body: 'Em 1911, em Detroit, nos Estados Unidos, William Durant, ex-fundador da General Motors, deu vida à Chevrolet. A marca se tornou sinônimo de carros populares, muscle cars e SUVs potentes, conquistando o coração do público americano. A "Gravata Borboleta", símbolo da marca, representa a confiabilidade e a inovação que acompanham seus modelos.',
    },
    {
      id: 9,
      title: 'Nissan: Sol Nascente, Tecnologia de Vanguarda',
      body: 'Em 1933, em Yokohama, no Japão, a fusão de várias empresas japonesas deu origem à Nissan. Seus carros são mundialmente reconhecidos por sua confiabilidade, economia e tecnologia inovadora. O "Sol Nascente", símbolo da marca, representa o Japão e a busca incessante pela excelência. A Nissan se tornou uma das maiores montadoras do mundo, com presença em diversos países e uma gama completa de modelos que atendem às mais variadas necessidades dos consumidores.',
    },
    // Outros objetos de post similares...
  ];

  // Método para retornar todos os posts
  findAll(): Post[] {
    return this.posts;
  }

  // Método para encontrar um post específico por ID
  findOne(id: number): Post {
    // Busca o post no array usando o método find do JavaScript
    const post = this.posts.find(post => post.id === id);
    // Lança uma exceção NotFoundException se o post não for encontrado
    if (!post) {
      throw new NotFoundException(`Postagem com o ID ${id} não encontrada!`);
    }
    return post; // Retorna o post encontrado
  }
}
