import 'dart:io';

class Bank {
  int? accountNumber;
  String? accountName;
  int? accountBalance;
  Bank(this.accountNumber, this.accountName, this.accountBalance);

  void displayBalance() {
    print('Your balance is ${this.accountBalance}');
  }

  void deposit(int depositAmount) {
    this.accountBalance = (this.accountBalance! + depositAmount);
    print('Money deposited successfully');
  }

  void withdraw(int withdrawAmount) {
    if (withdrawAmount <= this.accountBalance!) {
      this.accountBalance = (this.accountBalance! - withdrawAmount);
      print('Money withdrawn successfully');
    } else {
      print('insufficient funds');
    }
  }
}

void main() {
  List<Bank> acc = [
    Bank(1, 'Mohamed mahmoud', 5000),
    Bank(2, 'Ahmed mostafa ', 7000),
    Bank(3, 'Ali osama', 2500)
  ];

  stdout.write('Please enter your account number : ');
  int id = int.parse(stdin.readLineSync()!);
  id--;

  ATM(id, acc);
}

void ATM(int id, List<Bank> acc) {
  print(
      '_______________________ Hello ${acc[id].accountName} _______________________');

  print('Please choose an option : ');
  print('''1:Display balance
2:Deposit
3:Withdraw''');
  int x = int.parse(stdin.readLineSync()!);

  switch (x) {
    case 1:
      acc[id].displayBalance();
      restart(id, acc);

      break;
    case 2:
      stdout.write('Enter the deposit amount : ');
      int depositAmount = int.parse(stdin.readLineSync()!);
      acc[id].deposit(depositAmount);
      acc[id].displayBalance();
      restart(id, acc);
      break;
    case 3:
      stdout.write('Enter the withdrawal amount : ');
      int withdrawAmount = int.parse(stdin.readLineSync()!);
      acc[id].withdraw(withdrawAmount);
      acc[id].displayBalance();
      restart(id, acc);

      break;
    default:
      print('Wrong input');
      ATM(id, acc);
  }
}

void restart(int id, List<Bank> acc) {
  print(
      '________________________ Do YOU REQUIRE ANOTHER SERVICE? ________________________');
  stdout.write('Press 1 for Yes and 2 for No : ');
  int x = int.parse(stdin.readLineSync()!);
  switch (x) {
    case 1:
      ATM(id, acc);
      break;

    case 2:
      print(
          '________________________ Have a good day. ________________________');
      break;
    default:
      print('Wrong input');
  }
}
