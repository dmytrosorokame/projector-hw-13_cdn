# Projector HSA Home work #13: Content Delivery Network

## Todo:

1. Set up 7 containers:

- bind server
- load balancer 1
- load balancer 2
- node1
- node2
- node3
- node4

2. Try to implement different balancing approaches.

3. Write down pros and cons of each approach.

## Balancing approaches:

1. Round-robin
2. Least connections
3. IP hash

## How to test?:

1. Run `docker-compose up -d`
2. For testing USA zone run `docker-compose exec client-usa bash`
3. Run `for i in `seq 1 6`; do curl assets.net; echo "************************"; done`
4. For testing World zone run `docker-compose exec client-world bash`
5. Run `for i in `seq 1 6`; do curl assets.net; echo "************************"; done`

## Results:

### Round-robin:

#### Client USA:

```
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 4</title>
</head>
<body>
  <h1>World</h1>
  <h1>Node 4</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 3</title>
</head>
<body>
  <h1>World</h1>
  <h1>Node 3</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 4</title>
</head>
<body>
  <h1>World</h1>
  <h1>Node 4</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 3</title>
</head>
<body>
  <h1>World</h1>
  <h1>Node 3</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 4</title>
</head>
<body>
  <h1>World</h1>
  <h1>Node 4</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 3</title>
</head>
<body>
  <h1>World</h1>
  <h1>Node 3</h1>
</body>
</html>
```

#### Client World:

```
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 2</title>
</head>
<body>
  <h1>USA</h1>
  <h1>Node 2</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 1</title>
</head>
<body>
  <h1>USA</h1>
  <h1>Node 1</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 2</title>
</head>
<body>
  <h1>USA</h1>
  <h1>Node 2</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 1</title>
</head>
<body>
  <h1>USA</h1>
  <h1>Node 1</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 2</title>
</head>
<body>
  <h1>USA</h1>
  <h1>Node 2</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 1</title>
</head>
<body>
  <h1>USA</h1>
  <h1>Node 1</h1>
</body>
</html>
```

### Least connections:

#### Client USA:

```
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 3</title>
</head>
<body>
  <h1>World</h1>
  <h1>Node 3</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 3</title>
</head>
<body>
  <h1>World</h1>
  <h1>Node 3</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 4</title>
</head>
<body>
  <h1>World</h1>
  <h1>Node 4</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 3</title>
</head>
<body>
  <h1>World</h1>
  <h1>Node 3</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 4</title>
</head>
<body>
  <h1>World</h1>
  <h1>Node 4</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 3</title>
</head>
<body>
  <h1>World</h1>
  <h1>Node 3</h1>
</body>
</html>
```

#### Client World:

```
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 1</title>
</head>
<body>
  <h1>USA</h1>
  <h1>Node 1</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 1</title>
</head>
<body>
  <h1>USA</h1>
  <h1>Node 1</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 2</title>
</head>
<body>
  <h1>USA</h1>
  <h1>Node 2</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 1</title>
</head>
<body>
  <h1>USA</h1>
  <h1>Node 1</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 2</title>
</head>
<body>
  <h1>USA</h1>
  <h1>Node 2</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 1</title>
</head>
<body>
  <h1>USA</h1>
  <h1>Node 1</h1>
</body>
</html>
```

### IP hash:

#### Client USA:

```
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 3</title>
</head>
<body>
  <h1>World</h1>
  <h1>Node 3</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 3</title>
</head>
<body>
  <h1>World</h1>
  <h1>Node 3</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 3</title>
</head>
<body>
  <h1>World</h1>
  <h1>Node 3</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 3</title>
</head>
<body>
  <h1>World</h1>
  <h1>Node 3</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 3</title>
</head>
<body>
  <h1>World</h1>
  <h1>Node 3</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 3</title>
</head>
<body>
  <h1>World</h1>
  <h1>Node 3</h1>
</body>
</html>
```

#### Client World:

```
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 1</title>
</head>
<body>
  <h1>USA</h1>
  <h1>Node 1</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 1</title>
</head>
<body>
  <h1>USA</h1>
  <h1>Node 1</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 1</title>
</head>
<body>
  <h1>USA</h1>
  <h1>Node 1</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 1</title>
</head>
<body>
  <h1>USA</h1>
  <h1>Node 1</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 1</title>
</head>
<body>
  <h1>USA</h1>
  <h1>Node 1</h1>
</body>
</html>************************
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Node 1</title>
</head>
<body>
  <h1>USA</h1>
  <h1>Node 1</h1>
</body>
</html>
```

## Conclusion:

### Round-robin:

#### Pros:

- Simple to implement and understand
- Evenly distributes traffic across all servers
- No additional overhead or processing required

#### Cons:

- Doesn't consider server load or capacity
- Doesn't maintain session persistence
- Can lead to uneven load if requests have varying resource requirements

### Least connections:

#### Pros:

- Better load distribution based on actual server load
- Adapts to varying request complexities
- Prevents server overload

#### Cons:

- May not be optimal for short-lived connections

### IP hash:

#### Pros:

- Maintains session persistence (same client always goes to same server)
- Good for applications requiring session affinity
- Useful for caching strategies

#### Cons:

- May lead to uneven distribution if clients have varying loads
- Poor distribution if many clients share the same IP (e.g., behind NAT)
