

```python
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




    {'S': {'B', 'C', 'D'},
     'B': {'E', 'F', 'S'},
     'C': {'H', 'M', 'S'},
     'D': {'I', 'J', 'S'},
     'E': {'B'},
     'F': {'B'},
     'M': {'C', 'K', 'L'},
     'H': {'C', 'G'},
     'I': {'D'},
     'J': {'D'},
     'K': {'M'},
     'L': {'M'},
     'G': {'H'}}




```python
def dfs(graph, start):
    visited, stack = set(), [start]
    while stack:
        vertex = stack.pop()
        if vertex not in visited:
            visited.add(vertex)
            stack.extend(graph[vertex] - visited)
    return visited

dfs(graph, 'S')
```




    {'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'S'}




```python
def dfs(graph, start, visited=None):
    if visited is None:
        visited = set()
    visited.add(start)
    for next in graph[start] - visited:
        dfs(graph, next, visited)
    return visited

dfs(graph, 'C')
```




    {'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'S'}




```python
def dfs_paths(graph, start, goal):
    stack = [(start, [start])]
    while stack:
        (vertex, path) = stack.pop()
        for next in graph[vertex] - set(path):
            if next == goal:
                yield path + [next]
            else:
                stack.append((next, path + [next]))

list(dfs_paths(graph, 'S', 'G'))
```




    [['S', 'C', 'H', 'G']]




```python
list(dfs_paths(graph, 'S', 'K'))
```




    [['S', 'C', 'M', 'K']]


