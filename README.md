

```python
# Nombre: Cristhian Jumbo 
# Grupo: GR1
# Materia Inteligencia artificial
# primero declaramos el grafo

# primero declaramos el grafo

graph = {'S': set(['B', 'C', 'D']),
         'B': set(['S', 'E', 'F']),
         'C': set(['S', 'M', 'H']),
         'D': set(['S', 'I', 'J']),
         'E': set(['B']),
         'F': set(['B']),
         'M': set(['C', 'K', 'L']),
         'H': set(['C', 'G']),
         'I': set(['D']),
         'J': set(['D']),
         'K': set(['M']),
         'L': set(['M']),
         'G': set(['H'])}
graph
```


```python
# aplicamos la funcion para recorrer el arbol DFS
def dfs(graph, start, visitado=None):
    if visitado is None:
        visitado = set()
    visitado.add(start)
    for next in graph[start] - visitado:
        dfs(graph, next, visitado)
    print('nodo visitado:', visitado)    
    return visitado

# se van a imprimir los nodos visitados

dfs(graph, 'C')
```

    nodo visitado: {'C', 'B', 'S', 'E'}
    nodo visitado: {'C', 'B', 'E', 'F', 'S'}
    nodo visitado: {'C', 'B', 'E', 'F', 'S'}
    nodo visitado: {'C', 'B', 'E', 'F', 'D', 'I', 'S'}
    nodo visitado: {'C', 'B', 'E', 'F', 'J', 'D', 'I', 'S'}
    nodo visitado: {'C', 'B', 'E', 'F', 'J', 'D', 'I', 'S'}
    nodo visitado: {'C', 'B', 'E', 'F', 'J', 'D', 'I', 'S'}
    nodo visitado: {'C', 'B', 'E', 'F', 'J', 'G', 'D', 'H', 'I', 'S'}
    nodo visitado: {'C', 'B', 'E', 'F', 'J', 'G', 'D', 'H', 'I', 'S'}
    nodo visitado: {'C', 'B', 'E', 'F', 'J', 'M', 'G', 'L', 'D', 'H', 'I', 'S'}
    nodo visitado: {'C', 'B', 'E', 'F', 'J', 'M', 'K', 'G', 'L', 'D', 'H', 'I', 'S'}
    nodo visitado: {'C', 'B', 'E', 'F', 'J', 'M', 'K', 'G', 'L', 'D', 'H', 'I', 'S'}
    nodo visitado: {'C', 'B', 'E', 'F', 'J', 'M', 'K', 'G', 'L', 'D', 'H', 'I', 'S'}





    {'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'S'}




```python
def dfs_paths(graph, start, goal):
    pila = [(start, [start])]
    while pila:
        (vertex, path) = pila.pop()
        for next in graph[vertex] - set(path):
            if next == goal:
                yield path + [next]
            else:
                pila.append((next, path + [next]))
                print('valor pila: ',pila )

# Se van a imprimir los nodos que fueron visitados para llegar al objetivo  
print('valores de los nodos visitados')
list(dfs_paths(graph, 'S', 'G'))
```

    valores de los nodos visitados
    valor pila:  [('C', ['S', 'C'])]
    valor pila:  [('C', ['S', 'C']), ('B', ['S', 'B'])]
    valor pila:  [('C', ['S', 'C']), ('B', ['S', 'B']), ('D', ['S', 'D'])]
    valor pila:  [('C', ['S', 'C']), ('B', ['S', 'B']), ('I', ['S', 'D', 'I'])]
    valor pila:  [('C', ['S', 'C']), ('B', ['S', 'B']), ('I', ['S', 'D', 'I']), ('J', ['S', 'D', 'J'])]
    valor pila:  [('C', ['S', 'C']), ('E', ['S', 'B', 'E'])]
    valor pila:  [('C', ['S', 'C']), ('E', ['S', 'B', 'E']), ('F', ['S', 'B', 'F'])]
    valor pila:  [('H', ['S', 'C', 'H'])]
    valor pila:  [('H', ['S', 'C', 'H']), ('M', ['S', 'C', 'M'])]
    valor pila:  [('H', ['S', 'C', 'H']), ('L', ['S', 'C', 'M', 'L'])]
    valor pila:  [('H', ['S', 'C', 'H']), ('L', ['S', 'C', 'M', 'L']), ('K', ['S', 'C', 'M', 'K'])]





    [['S', 'C', 'H', 'G']]




```python
list(dfs_paths(graph, 'S', 'K'))
```

    valor pila:  [('C', ['S', 'C'])]
    valor pila:  [('C', ['S', 'C']), ('B', ['S', 'B'])]
    valor pila:  [('C', ['S', 'C']), ('B', ['S', 'B']), ('D', ['S', 'D'])]
    valor pila:  [('C', ['S', 'C']), ('B', ['S', 'B']), ('I', ['S', 'D', 'I'])]
    valor pila:  [('C', ['S', 'C']), ('B', ['S', 'B']), ('I', ['S', 'D', 'I']), ('J', ['S', 'D', 'J'])]
    valor pila:  [('C', ['S', 'C']), ('E', ['S', 'B', 'E'])]
    valor pila:  [('C', ['S', 'C']), ('E', ['S', 'B', 'E']), ('F', ['S', 'B', 'F'])]
    valor pila:  [('H', ['S', 'C', 'H'])]
    valor pila:  [('H', ['S', 'C', 'H']), ('M', ['S', 'C', 'M'])]
    valor pila:  [('H', ['S', 'C', 'H']), ('L', ['S', 'C', 'M', 'L'])]
    valor pila:  [('G', ['S', 'C', 'H', 'G'])]





    [['S', 'C', 'M', 'K']]


