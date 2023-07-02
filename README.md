Constantinescu Delia-Georgiana
Grupa 313CA
Tema 2

Task 1
    - iterating through the plain-text string character by character
    - adding the step value to each character
    - if the ASCII code of the character is greater than 90 (Z),
subtracting 26 (simulating a circular shift)
    - copying the encrypted string at its respective address

Task 2
 a) points distance
    - getting the y coordinates of the 2 given points (situated on a
    vertical/ horizontal line) and comparing them
    - if they are not equal, subtracting the lower one from the greater
    - if the y coordinates are equal, doing the same for the x coordinates
    - if both coordinates are equal, the points concide and the distance
    is 0

 b) road
    - iterating through the vector and calculating the distance pairs
    of 2 "adjacent" points
    - using the algorithm from the previous task to calculate the distance
    - storing the results at their respective address

 c) is square
    - iterating through the distance vector
    - verifying for each element if there is a perfect square that is
    equal to it (similar to a while loop)
    - if the distance is between 2 consecutive perfect squares, placing
    a 0 on its position in the output vector
    - otherwise, placing a 1

Task 3
    - iterating through the plain-text string and the key at the same time
    - subtracting each letter in the plain-text string from its respective letter
    in the key string
    - if their difference is negative, adding 26 to its value
    - iterating through the key and the encrypted string as follows:

for (i = 0; i < len_plain; i++) {
    j = 0;
    while (j < len_key) {
        if (key[i] - plain[j] <= 0) {
            enc[i] = 'A' + key[i] - plain[j] + 26;
        } else {
             enc[i] = 'A' + key[i] - plain[j];
        }
        j++;
        i++;
        if (i >= len_plain) {
            break;
        }
    }
}

Task 4
    - copying the plain-text string in the encrypted string character by
    character to make it easier to work with
    - implementing spiral matrix walkthrough:

while (k < m && l < n) {
    for (i = l; i < n; i++) {
        enc[eax] += key[k][i];
        eax++;
    }
    k++;

    for (i = k; i < m; i++) {
        enc[eax] += key[i][n - 1];
        eax++;
    }
    n--;

    if (k < m) {
        for (i = n - 1; i >= l; i--) {
            enc[eax] += key[m - 1][i];
            eax++;
        }
        m--;
    }

    if (l < n) {
        for (i = m - 1; i >= k; i--) {
            enc[eax] += key[i][l];
            eax++;
        }
        l++;
    }
}