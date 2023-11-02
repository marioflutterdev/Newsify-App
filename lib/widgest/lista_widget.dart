import 'package:app_noti/models/new_models.dart';
import 'package:flutter/material.dart';

class ListaWidget extends StatelessWidget {
  final List<Article> noticias;
  const ListaWidget(this.noticias, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (context, index) {
        return TargetaWidget(noticia: noticias[index], index: index);
      },
    );
  }
}

class TargetaWidget extends StatelessWidget {
  final Article noticia;
  final int index;

  const TargetaWidget({super.key, required this.noticia, required this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _TopCardWidget(index: index, noticia: noticia),
        _CenterCardWidget(noticia: noticia),
        _ImageWidget(noticia: noticia),
        _LabelWidget(noticia: noticia)
      ],
    );
  }
}

class _TopCardWidget extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TopCardWidget({Key? key, required this.noticia, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        children: [
          Text(
            '${index.toString()}.',
            style: const TextStyle(color: Colors.red),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(noticia.source.name),
        ],
      ),
    );
  }
}

class _CenterCardWidget extends StatelessWidget {
  final Article noticia;

  const _CenterCardWidget({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        noticia.title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class _ImageWidget extends StatelessWidget {
  final Article noticia;
  const _ImageWidget({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: noticia.urlToImage != null
          ? ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(15),
              child: FadeInImage(
                placeholder: const AssetImage('assets/img/giphy.gif'),
                image: NetworkImage(noticia.urlToImage ?? ''),
              ),
            )
          : const Image(
              image: AssetImage('assets/img/no-image.png'),
            ),
    );
  }
}

class _LabelWidget extends StatelessWidget {
  final Article noticia;
  const _LabelWidget({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Text(noticia.description ?? ''),
    );
  }
}
