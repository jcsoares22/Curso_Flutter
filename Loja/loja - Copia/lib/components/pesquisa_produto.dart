import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PesquisaProduto extends StatefulWidget {
  const PesquisaProduto({super.key});

  @override
  State<PesquisaProduto> createState() => _PesquisaProdutoState();
}

class _PesquisaProdutoState extends State<PesquisaProduto> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Scaffold(
          body: SearchBar(),
        ),
      ],
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      decoration: const InputDecoration(
        labelText: 'Pesquisar números',
        hintText: 'Digite números aqui',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
      ),
      onChanged: (value) {
        // Lógica para lidar com alterações na pesquisa
        print('Consulta atualizada: $value');
      },
    );
  }
}
