import time
import keyboard

LocalControlButton = 0
LowerLimitEndOfRace = 0x00
UpperLimitEndOfRace = 0x00
ChildLockButton = 0x00
possWindow = 100
S1 = 0
S2 = 0
S3 = 0
S4 = 0
if __name__ == '_main_':
    while True:
        print("fa coses")
        # key = msvcrt.getch().decode('utf-8')

        if keyboard.is_pressed('1'):  # STG_FAULT
            pass
        elif keyboard.is_pressed('2'):  # MANUAL_DOWN
            LocalControlButton = "MANUAL_DOWN"

            if ChildLockButton == 0x01:
                if possWindow > 0:
                    S1, S2, S3, S4 = 0, 1, 1, 0
                    possWindow -= 1
                    time.sleep(0.03)
                    LowerLimitEndOfRace = 0x00
                elif possWindow == 0:
                    LowerLimitEndOfRace = 0x01

        elif keyboard.is_pressed('3'):  # MANUAL_UP
            LocalControlButton = "MANUAL_UP"

            if ChildLockButton == 0x01:
                if possWindow < 100:
                    S1, S2, S3, S4 = 1, 0, 0, 1
                    possWindow += 1
                    time.sleep(0.03)
                    UpperLimitEndOfRace = 0x00
                elif possWindow == 100:
                    UpperLimitEndOfRace = 0x01
        elif keyboard.is_pressed('4'):  # AUTO_DOWN
            break
        elif keyboard.is_pressed('5'):  # AUTO_UP
            break
        elif keyboard.is_pressed('6'):  # CHILD_LOCK_ENABLED
            ChildLockButton = 0x00
        elif keyboard.is_pressed('7'):  # CHILD_LOCK_DISABLED
            ChildLockButton = 0x01
        else:
            S1, S2, S3, S4 = 0, 1, 0, 1
            LocalControlButton = "NO_REQUEST"
            time.sleep(1)
    print(
        f"LocalControlButton: {LocalControlButton}  LowerLimitEndOfRace: {LowerLimitEndOfRace}  UpperLimitEndOfRace: {UpperLimitEndOfRace}  ChildLockButton: {ChildLockButton}  possWindow: {possWindow}  S1: {S1}  S2: {S2}  S3: {S3}  S4: {S4}")

    time.sleep(1)
