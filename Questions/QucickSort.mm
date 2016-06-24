//
//  QucickSort.m
//  Questions
//
//  Created by wyz on 16/6/22.
//  Copyright © 2016年 com.pencho.com. All rights reserved.
//

#import "QucickSort.h"

void sort(int *a ,int left ,int right) {
    if (left >= right) {
        return;
    }
    
    int i = left;
    int j = right;
    int key = a[left];
    while (i < j) {
        while (i < j && key <= a[j]) {
            j--;
        }
        a[i] = a[j];
        
        while (i < j && key > a[i]) {
            i++;
        }
        a[j] = a[i];
    }
    a[i] = key;
    sort(a, left, i-1);
    sort(a, i+1, right);
}

void sort2(int *a,int n) {
    for (int i = 0; i < n - 1; i++) {
        for (int j = 0; j < n - i - 1; j++) {
            if (a[j] < a[j+1]) {
                //swap
            }
        }
    }
}


@implementation QucickSort

@end
