import UIKit

var arregloStr = ["Zacarias","Aldo", "Alberto", "Bryan", "Maria"]
//var arregloNumeros = [1,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59]
//arregloNumeros.sort()
arregloStr.sort()

//Busqueda binaria -> Complejidad O(log n)
func busquedaBinariaIterativa<T: Comparable>(arreglo : [T], elemento: T) -> Int? {
    var minimo = 0
    var maximo = arreglo.count
    while minimo < maximo {
        //calculamos el indice medio del arreglo
        let indiceMedio = (maximo + minimo) / 2
        
        if arreglo[indiceMedio] == elemento {
            return indiceMedio
        } else if arreglo[indiceMedio] < elemento {
            //usaremos la segunda mitad del arreglo
            minimo = indiceMedio + 1
        } else {
            //IF arreglo[indiceMedio] > elemento
            //usaremos la primera mitad del arreglo
            maximo = indiceMedio - 1
        }
    }
    return nil
}
print(busquedaBinariaIterativa(arreglo: arregloStr, elemento: "Bryan")!)
//print(busquedaBinariaIterativa(arreglo: arregloNumeros, elemento: 37)!)

func busquedaBinariaRecursiva<T: Comparable>(arreglo: [T], elemento: T, rango: Range<Int>)->Int? {
    if rango.lowerBound > rango.upperBound {
        //No se ha encontrado el elemento dentro del arreglo
        return nil
    }else {
        let indexMedio = (rango.lowerBound + rango.upperBound) / 2
        if arreglo[indexMedio] > elemento {
            return busquedaBinariaRecursiva(arreglo: arreglo, elemento: elemento, rango: rango.lowerBound..<indexMedio)
        }else if arreglo[indexMedio] < elemento {
            return busquedaBinariaRecursiva(arreglo: arreglo, elemento: elemento, rango: indexMedio + 1 ..< rango.upperBound)
        }else {
            return indexMedio
        }
    }
}

print(busquedaBinariaRecursiva(arreglo: arregloStr, elemento: "Bryan", rango: 0..<arregloStr.count)!)
//print(busquedaBinariaRecursiva(arreglo: arregloNumeros, elemento: 37, rango: 0..<arregloNumeros.count)!)

//Busqueda secuencial o lineal -> Complejidad O(n)
func busquedaLineal<T: Equatable>(arreglo: [T], _ elemento: T) -> Int {
    for (index, item) in arreglo.enumerated() where item == elemento {
        return index
    }
    return -1
}

print("El elemento ha sido encontrado en la posición: \(busquedaLineal(arreglo: arregloStr, "Bryan"))")



//Comparación entre una busqueda en binary tree y busqueda lineal

//          10
//         /  \
//        5    14
//       /    /  \
//      1    11  20

class Node {
    let value: Int
    let leftChild: Node?
    let rightChild: Node?
    
    init(value: Int, leftChild: Node?, rightChild: Node?) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}
//rama Izquierda
let oneNode = Node.init(value: 1, leftChild: nil, rightChild: nil)
let fiveNode = Node.init(value: 5, leftChild: oneNode, rightChild: nil)

//rama derecha
let elevenNode = Node.init(value: 11, leftChild: nil, rightChild: nil)
let twentyNode = Node.init(value: 20, leftChild: nil, rightChild: nil)
let fourteenNode = Node.init(value: 14, leftChild: elevenNode, rightChild: twentyNode)

//padre
let tenRootNode = Node.init(value: 10, leftChild: fiveNode, rightChild: fourteenNode)

func search(node: Node?, searchValue: Int) -> Bool {
    if node == nil {
        return false
    }
    if node?.value == searchValue {
        return true
    }else if searchValue < node!.value {
        return search(node: node?.leftChild, searchValue: searchValue)
    }else {
        return search(node: node?.rightChild, searchValue: searchValue)
    }
    
}
search(node: tenRootNode, searchValue: 20)

let arreglo = [1,2,3,4,5,6,7,10,20]
let index = arreglo.firstIndex(where: {$0 == 20})


