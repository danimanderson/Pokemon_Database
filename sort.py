import pandas as p

file = p.read_csv('pokemonmovesV2.csv')

filtered_file = file.groupby('pokemon_id')['move_id'].apply(list).reset_index()
filtered_file['move_id'] = file['move_id'].apply(lambda x: list(set(x)))


filtered_file.to_csv('filtered_pokemon_moves.csv', index=False)
