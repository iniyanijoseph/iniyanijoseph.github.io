from tkinter import *
from tkinter import filedialog
import os
win = Tk()
real_path = os.path.realpath(__file__)
real_path = os.path.dirname(real_path)

win.iconphoto(False, PhotoImage(
    file=real_path + '//Assets//Notepad--.png'))
win.title("Notepad--")
width = 500
height = 600
win.geometry(str(width) + "x" + str(height))


def openfile():
    try:
        file = filedialog.askopenfilename(
            defaultextension=".txt", filetypes=[("All Files", "*.*"), ("Text File", "*.txt")])
        file = open(file)
        file = file.read()
        text.delete(1.0, END)
        text.insert(END, file)
    except:
        pass


def savefile():
    try:
        file = filedialog.asksaveasfilename(defaultextension=".txt", filetypes=[
            ("All Files", "*.*"), ("Python Files", "*.txt")])
        file = open(file, "w")
        file = file.write(text.get(1.0, END))
    except:
        pass


menu = Menu(win)
menu.add_command(label="Open", command=openfile)
menu.add_command(label="Save", command=savefile)

text = Text(win, width=width, height=height)
scrollbar = Scrollbar(win)
scrollbar.pack(side=RIGHT, fill=Y)

text.pack(side=LEFT, fill=BOTH)
scrollbar.config(command=text.yview)

win.config(menu=menu)

mainloop()

