//
//  PokeManager.swift
//  PokedexTest
//
//  Created by Jackson Barnes on 9/5/21.
//

import Foundation

protocol  PokemonManagerDelegate{
    func didFetchPokemon(pokemon: [Pokemon])
    func didFail(error: Error?)
}

struct PokemonManager {
    var delegate: PokemonManagerDelegate?
    func fetchPokemon() {
        //Build URL - https://pokeapi.co/api/v2/pokemon/
        guard let url = URL (string: "https://pokeapi.co/api/v2/pokemon/?limit=151") else{
            delegate?.didFail(error: nil)
            return
        }
        
        //Request
        URLSession.shared.dataTask(with: url)
        {data, _, error in
        
        //Error
            if let error = error{
                delegate?.didFail(error: error)
                return
            }
        
        //Data
            guard let data = data else{
                delegate?.didFail(error: nil)
                return
            }
        
        //Decode
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(PokeAPIResponse.self, from: data)
                let pokemon = response.results
                delegate?.didFetchPokemon(pokemon: pokemon)
            } catch {
                delegate?.didFail(error: error)
                return
                
    }
        }.resume()
}
}
