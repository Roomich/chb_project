from aiogram import Bot, Dispatcher, executor, types
from config import API_TOKEN


HELP_CONTEXT = """
/start - начать работу бота
/help - вывести справочную информацию
"""


bot = Bot(token=API_TOKEN)
dp = Dispatcher(bot)

@dp.message_handler(commands=['start'])
async def send_welcome(message: types.Message):
    await message.answer("Привет!\nЯ тестовый бот\nОтправь мне любое сообщение, а я тебе обязательно отвечу.")
    await message.delete()

@dp.message_handler(commands=['help'])
async def echo(message: types.Message):
    await message.reply(HELP_CONTEXT)

if __name__ == '__main__':
    executor.start_polling(dp, skip_updates=True)