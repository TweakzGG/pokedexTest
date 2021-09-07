//
//  PokeTableViewController.swift
//  PokedexTest
//
//  Created by Jackson Barnes on 9/5/21.
//

import UIKit

class PokeTableViewController: UITableViewController {
var manager = PokemonManager()
    var pokemon: [Pokemon] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        manager.delegate = self
        manager.fetchPokemon()
        
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return pokemon.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pokeCell", for: indexPath)
        cell.textLabel?.text = pokemon[indexPath.row].name.capitalized

        return cell
    }

}
extension PokeTableViewController: PokemonManagerDelegate{
    func didFail(error: Error?) {
        print(error as Any)
    }
    
    func didFetchPokemon(pokemon: [Pokemon]) {
        DispatchQueue.main.async {
            self.pokemon = pokemon
            self.tableView.reloadData()
            
        }
    }
    
}
