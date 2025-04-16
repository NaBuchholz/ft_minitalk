# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: nbuchhol <nbuchhol@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/16 10:51:51 by nbuchhol          #+#    #+#              #
#    Updated: 2025/04/16 13:00:33 by nbuchhol         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = minitalk
CLIENT = client
SERVER = server
CC = cc
CFLAGS = -Wall -Wextra -Werror
SRC_DIR = src
OBJ_DIR = obj
LIBFT_DIR = libft
LIBFT = ${LIBFT_DIR}/libft.a
PRINTF_DIR = ${LIBFT_DIR}/printf
PRINTF = ${PRINTF_DIR}/libftprintf.a
INCLUDES_DIR = includes
INC = -I${INCLUDES_DIR} -I${LIBFT_DIR} -I${PRINTF_DIR}/includes
ARGS ?= "hello, it's working!"
DEPFLAGS = -MMD -MP

all: ${LIBFT} ${NAME}

${NAME}: ${LIBFT} ${CLIENT} ${SERVER}

${CLIENT}: ${OBJ_DIR} ${LIBFT}
	@${CC} ${CFLAGS} ${SRC_DIR}/client.c ${SRC_DIR}/utils.c ${INC} ${LIBFT} ${PRINTF} -o ${CLIENT}
	@echo "|Client was created!|"

${SERVER}: ${OBJ_DIR} ${LIBFT}
	@${CC} ${CFLAGS} ${SRC_DIR}/server.c ${SRC_DIR}/utils.c ${INC} ${LIBFT} ${PRINTF} -o ${SERVER}
	@echo "|Server was created!|"

${OBJ_DIR}:
	@mkdir -p ${OBJ_DIR}

${OBJ_DIR}/%.o: ${SRC_DIR}/%.c
	@${CC} ${CFLAGS} ${DEPFLAGS} ${INC} -c $< -o $@

${LIBFT}:
	@make -C ${LIBFT_DIR}

clean:
	@rm -rf ${OBJ_DIR}
	@make -C ${LIBFT_DIR} clean
	@make -C ${PRINTF_DIR} clean

fclean: clean
	@rm -f ${CLIENT} ${SERVER}
	@make -C ${LIBFT_DIR} fclean
	@make -C ${PRINTF_DIR} fclean

re: fclean all

debug: CFLAGS += -g3
debug: re
	@echo "| Running Valgrind Memory Check |"
	@valgrind --leak-check=full \
		--show-leak-kinds=all \
		--track-origins=yes \
		./${CLIENT} $(shell pgrep server) ${ARGS}

.PHONY: all clean fclean re debug
