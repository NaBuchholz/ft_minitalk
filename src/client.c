/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nbuchhol <nbuchhol@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/04/16 10:28:20 by nbuchhol          #+#    #+#             */
/*   Updated: 2025/04/16 12:24:12 by nbuchhol         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../includes/minitalk.h"

int	main(int ac, char **av)
{
	if (ac < 1)
	{
		ft_printf("%s", av[1]);
	}
	return (0);
}
