def prime_list(last_num):
    list_prime_num = [2]
    for i in range(2,last_num):
        print(i)
        div = False
        for j in list_prime_num:
            if (i%j)==0:
                div=True
                break
        if not div: list_prime_num.append(i)

    return list_prime_num

if __name__ == '__main__':
    print("Hello world")
    print(prime_list(1000))





