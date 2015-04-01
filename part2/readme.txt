Angelo Marcelo, Mona Mohebbi, and Yamini Nambiar

In this section there are two driver functions. cc_driver() for the convolutional codes part and iterative_driver(filename_for_A, filename_for_y).


1) 
The first driver function is called cc_driver. It tests the encoding and decoding portion of this section. It has no parameters and should be called from the console in this way
    | cc_driver()

You will be prompted to enter "e" to encode a random binary sequence or "d" to decode a given encoded binary sequence.

---------------------------------------------------------------------------------------------------------------------
ENCODE
  Enter "e" to encode a random binary sequence.
      Would you like to encode or decode? Enter e to encode or d to decode. e

  The driver will ask you to enter the size of the vector you want to encode.
      Enter size of vector you want to encode. 5

  The output will be printed like this, for example
      Encoded random binary sequence of length n:
      11 01 10 11 00 00 00 00
---------------------------------------------------------------------------------------------------------------------
DECODE
 Enter "d" to decode a given encoded binary sequence.
      Would you like to encode or decode? Enter e to encode or d to decode. e

  If you are going to decode, the driver will ask you to enter the vector you want to decode. Enter the vector like    this.
      Enter the vector you want to decode without brackets. 11 01 10 11 00 00 00 00
  
  The program will then return the decoded original binary sequence.
      Decoded binary sequence:
       1     0     0     0     0
---------------------------------------------------------------------------------------------------------------------



2) 
The second driver is called iterative_driver. This driver tests the Jacobi and Guass-Seidel iterative methods. It takes in two parameters, the filename of the file that holds A and the filename of the file that holds y. The tolerance Call the driver like this
      iterative_driver('a.dat', 'y.dat')

You will be prompted to enter "j" to use Jacobi and "g" to use Gauss_Seidel to solve your linear system.
---------------------------------------------------------------------------------------------------------------------
JACOBI
Enter j to solve using Jacobi.
      Which iterative method would you like to use? Enter j for Jacobi and g for Gauss-Seidel. j  

The output will print out A, y, the solution, x, and the number of iterations to converge. If the method does not converge a message saying so will print to the console.
    A = 
       4     1
       2     3

    y = 
       6
       8

    The number of iterations to find the solution x, 
        1.0000
        2.0000

    is
       22
       
---------------------------------------------------------------------------------------------------------------------
GAUSS-SEIDEL
Enter g to solve using Gauss-Seidel.
      Which iterative method would you like to use? Enter j for Jacobi and g for Gauss-Seidel. g  

The output will print out A, y, the solution, x, and the number of iterations to converge. If the method does not converge a message saying so will print to the console.
    A = 
     4     1
     2     3

y = 
     6
     8

The number of iterations to find the solution x, 
    1.0000
    2.0000

is
    12
---------------------------------------------------------------------------------------------------------------------

