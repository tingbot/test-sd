import tingbot
from tingbot import *

# setup code here
state = {
    'screen': 0,
}

@every(seconds=2)
def tick():
    state['screen'] += 1
    
    if state['screen'] > 2:
        state['screen'] = 0
    
    if state['screen'] == 0:
        screen.fill(color='black')
        screen.text('Hello world!', color='white')
    elif state['screen'] == 1:
        screen.fill(color='green')
        screen.text('Hello world!', color='white')
    elif state['screen'] == 2:
        screen.fill(color='grey')
        screen.text('Hello world!', color='white')

@touch()
def on_touch(xy):
    screen.rectangle(xy=xy, color='white', size=(10,10))
    
def loop():
    pass

tingbot.run(loop)
