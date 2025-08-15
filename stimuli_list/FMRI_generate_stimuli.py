# CREATE STIMULI FOR PERCEPTION - CHANGE 1 VALUE EACH TIME
import random
import numpy as np
import pandas as pd
import copy
##### LOCATIONS TO CHANGE NUMBERS #####
# LINES 11 = change number of trials
# LINES 21 ======== change number of trials before switching
# LINES 296 = change number of trials and number of blocks
# LINES 349 = change name of stimuli list output
# LINES 358 = change number of iterations
def final_generations(number_of_files):
    def create_one_block():
        # create stimuli vector, then shuffle it so we can create randomized dictionaries
        stimuli_vector = ['resources/alien_ananas.png',
                          'resources/alien_apple.png',
                          'resources/alien_ball.png',
                          'resources/alien_ballet.png',
                          'resources/alien_bag.png',
                          'resources/alien_bear.png',
                          'resources/alien_bee.png',
                          'resources/alien_beetle.png',
                          'resources/alien_bell.png',
                          'resources/alien_blue.png',
                          'resources/alien_blueberry.png',
                          'resources/alien_brain.png',
                          'resources/alien_book.png',
                          'resources/alien_broccoli.png',
                          'resources/alien_bubbletea.png',
                          'resources/alien_butterfly.png',
                          'resources/alien_cabbage.png',
                          'resources/alien_cactus.png',
                          'resources/alien_burger.png',
                          'resources/alien_can.png',
                          'resources/alien_carpet.png',
                          'resources/alien_carrot.png',
                          'resources/alien_bird.png',
                          'resources/alien_cheese.png',
                          'resources/alien_chess.png',
                          'resources/alien_chicken.png',
                          'resources/alien_chilli.png',
                          'resources/alien_cloud.png',
                          'resources/alien_coffee.png',
                          'resources/alien_comb.png',
                          'resources/alien_cookie.png',
                          'resources/alien_crab.png',
                          'resources/alien_coconut.png',
                          'resources/alien_cube.png',
                          'resources/alien_cyclope.png',
                          'resources/alien_diamond.png',
                          'resources/alien_donut.png',
                          'resources/alien_dragonfruit.png',
                          'resources/alien_egg.png',
                          'resources/alien_fish.png',
                          'resources/alien_flower.png',
                          'resources/alien_flytrap.png',
                          'resources/alien_fruit.png',
                          'resources/alien_garbage.png',
                          'resources/alien_ghost.png',
                          'resources/alien_glove.png',
                          'resources/alien_guitar.png',
                          'resources/alien_eggplant.png',
                          'resources/alien_hamster.png',
                          'resources/alien_hat.png',
                          'resources/alien_house.png',
                          'resources/alien_ice.png',
                          'resources/alien_icecream.png',
                          'resources/alien_sock.png',
                          'resources/alien_jellyfish.png',
                          'resources/alien_juice.png',
                          'resources/alien_koala.png',
                          'resources/alien_ladybug.png',
                          'resources/alien_lemon.png',
                          'resources/alien_lizard.png',
                          'resources/alien_lollipop.png',
                          'resources/alien_maracuya.png',
                          'resources/alien_milk.png',
                          'resources/alien_mouse.png',
                          'resources/alien_muffin.png',
                          'resources/alien_mug.png',
                          'resources/alien_mushroom.png',
                          'resources/alien_neuron.png',
                          'resources/alien_mixer.png',
                          'resources/alien_oneeye.png',
                          'resources/alien_onion.png',
                          'resources/alien_peas.png',
                          'resources/alien_pig.png',
                          'resources/alien_pistachio.png',
                          'resources/alien_pizza.png',
                          'resources/alien_plate.png',
                          'resources/alien_pot.png',
                          'resources/alien_potato.png',
                          'resources/alien_power.png',
                          'resources/alien_pretzel.png',
                          'resources/alien_pumpkin.png',
                          'resources/alien_puzzle.png',
                          'resources/alien_raddish.png',
                          'resources/alien_robot.png',
                          'resources/alien_spaceship.png',
                          'resources/alien_sandwich.png',
                          'resources/alien_screw.png',
                          'resources/alien_shrimp.png',
                          'resources/alien_slime.png',
                          'resources/alien_pancake.png',
                          'resources/alien_snail.png',
                          'resources/alien_snake.png',
                          'resources/alien_soap.png',
                          'resources/alien_sour.png',
                          'resources/alien_penguin.png',
                          'resources/alien_splash.png',
                          'resources/alien_squirrel.png',
                          'resources/alien_star.png',
                          'resources/alien_starfish.png',
                          'resources/alien_sushi.png',
                          'resources/alien_redfruit.png',
                          'resources/alien_threeeyes.png',
                          'resources/alien_toaster.png',
                          'resources/alien_television.png',
                          'resources/alien_toxic.png',
                          'resources/alien_virus.png',
                          'resources/alien_volcano.png',
                          'resources/alien_walnut.png',
                          'resources/alien_watermelon.png',
                          'resources/alien_worm.png',
                          'resources/alien_yarn.png']

        shuffled_indices = list(range(len(stimuli_vector)))
        random.shuffle(shuffled_indices)
        print(shuffled_indices)

        apple_pairs = zip(shuffled_indices, stimuli_vector)
        stim_to_key_dict = dict(apple_pairs)
        print("stim_to_key_dict", stim_to_key_dict)

        shuffled_strings = [stim_to_key_dict[index] for index in shuffled_indices]

        print("reversed", shuffled_strings)

        #### CHANGE YOUR TRIAL NUMBER HERE. IT IS TRIALS PER BLOCK ###
        # e.g. 6 trials per block, 4 blocks in total, 6*4 = 24 trials/condition
        trials = 36
        # create a row vector of size trials * runs with zeros
        full_block = np.zeros(trials)

        # full interval of 5-12 trials before switching
        interval_min = 4
        interval_max = 5

        switch = 0

        # create indices where new stimuli is introduced
        x = random.randint(interval_min, interval_max)
        i = 0  # Initialize i

        while i < len(full_block):
            if i <= x:
                full_block[i] = switch
                i = i + 1
            elif i > x:
                switch = switch + 1
                full_block[i] = switch
                i = i + 1
                x = x + random.randint(interval_min, interval_max)

        print("full_block", full_block)

        ####### STIMULI #######
        stimuli = []
        # the number of stimuli being shown
        OG_N_stimuli = 2
        # just setting a variable that equals 0
        zero_min = 0

        i = 0
        w = 0
        p = 0

        # List of available probabilities
        available_probabilities = [0.1, 0.3, 0.5, 0.7, 0.9]
        # INITIATE FIRST ROW VECTOR OF THREE VALUES, STORE IT IN THE DICTIONARY
        OG_probs = random.sample(available_probabilities, 3)
        print("OG_probs", OG_probs)
        random.shuffle(OG_probs)

        OG_image = random.sample(shuffled_strings, 3)
        print("OG_image", OG_image)

        # Remove the remaining values in the vector from available_probabilities
        for value in OG_image:
            if value in shuffled_strings:
                shuffled_strings.remove(value)

        # create a dictionary of stimulus to value
        stim_dict = {}

        # for i, key in enumerate(OG_image):
        # key = str(i)
        #    key = i
        #    value = OG_probs[i]
        #    stim_dict[key] = value

        # Use a for loop with enumerate to populate the dictionary
        for i, key in enumerate(OG_image):
            value = OG_probs[i]
            stim_dict[key] = value

        print(stim_dict)
        # Initialize some variables
        current_number = 0
        stimuli_draft = []
        image_list = []
        change_list = []
        image_fixed_list = []
        OG_change = ['nochange', 'nochange', 'nochange', 'nochange', 'nochange']

        original_stim = copy.deepcopy(OG_probs)
        original_img = copy.deepcopy(OG_image)

        while current_number <= max(full_block):
            if current_number == 0:
                image_fixed_list.extend([OG_image] * np.count_nonzero(full_block == current_number))
                for _ in range(np.count_nonzero(full_block == current_number)):
                    random.shuffle(OG_probs)
                    random.shuffle(OG_image)
                    stimuli_draft.append(OG_probs.copy())  # Append a copy of OG_probs
                    image_list.append(OG_image.copy())  # Append a copy of OG_image
                    change_list.append(OG_change)  # Append OG_change directly since it's not being modified
            else:
                # this part is to randomly draw the indices
                while True:
                    random_number1 = random.randint(zero_min, OG_N_stimuli)
                    random_number2 = random.randint(zero_min, OG_N_stimuli)

                    if random_number1 != random_number2:
                        break

                # store drawn indices in a list
                indices_drawn = [random_number1, random_number2]
                # find the index that is being changed (called old_index here)
                all_indices = set(range(len(OG_image)))
                old_index = (all_indices - set(indices_drawn)).pop()  # index of where number/value is being changed
                old_tochange = OG_image[old_index]  # the actual value to be changed
                left_alone_value1 = OG_image[random_number1]
                left_alone_value2 = OG_image[random_number2]
                to_change = random.choice(shuffled_strings)  # new value/image/number
                shuffled_strings.remove(to_change)  # remove from shuffled_indices

                OG_image = [left_alone_value1, left_alone_value2, to_change]
                image_fixed_list.extend([OG_image] * np.count_nonzero(full_block == current_number))
                random.shuffle(OG_image)

                new_index = OG_image.index(to_change)
                sentence = f"The number {old_tochange} originally at index {old_index} is now replaced with {to_change} at index {new_index}."
                for _ in range(np.count_nonzero(full_block == current_number)):
                    random.shuffle(OG_image)
                    image_list.append(OG_image.copy())  # Append a copy of OG_image
                #image_list.extend([OG_image] * np.count_nonzero(full_block == current_number))
                vect_change = [old_tochange, old_index, to_change, new_index, sentence]
                change_list.extend([vect_change] * np.count_nonzero(full_block == current_number))

                # CREATING THE PROBABILITY NOW
                left_aloneValue1 = stim_dict[left_alone_value1]
                left_aloneValue2 = stim_dict[left_alone_value2]
                old_toChange = stim_dict[old_tochange]

                while True:
                    prob_to_change = random.choice(available_probabilities)

                    if prob_to_change != left_aloneValue1 and prob_to_change != left_aloneValue2 and prob_to_change != old_toChange:
                        break

                stim_dict[to_change] = prob_to_change

            current_number += 1

        stimuli = [[stim_dict.get(item, item) for item in sublist] for sublist in image_list]
        stimuli_fixed = [[stim_dict.get(item, item) for item in sublist] for sublist in image_fixed_list]

        print("shuffled indices of images (shuffled_indices)", shuffled_indices)
        print("image vector (stimuli_vector)", stimuli_vector)
        print("number to image dictionary (stim_to_key_dict)", stim_to_key_dict)
        print('number to probability (stim_dict)', stim_dict)
        print('stimuli', stimuli)
        print("image_list", image_list)
        ########################################################################
        ###################### CHANGING STIM VECTORS INTO COLS #################
        ########################################################################
        # transpose
        transposed_vectors = list(zip(*image_list))
        # create lists for each column
        columns = [list(column) for column in transposed_vectors]

        # JUST CHECKING N VISUALIZING HERE
        # transposed_vectors = [['A1', 'A2', 'A3'],
        #                      ['B1', 'B2', 'B3'],
        #                      ['C1', 'C2', 'C3']]

        # convert to numpy array
        matrix_stim = np.array(columns).T

        ########################################################################
        ############### CHANGING PROBABILITY VECTORS INTO COLS #################
        ########################################################################

        # transpose
        transposed_prob = list(zip(*stimuli))
        # create lists for each column
        columns_prob = [list(column) for column in transposed_prob]

        # convert to numpy array
        matrix_prob = np.array(columns_prob).T

        # transpose
        transposed_probFixed = list(zip(*stimuli_fixed))
        # create lists for each column
        columns_probFixed = [list(column) for column in transposed_probFixed]

        # convert to numpy array
        matrix_probFixed = np.array(columns_probFixed).T

        ########################################################################
        ############### CHANGING CHANGE MATRICES INTO COLS #################
        ########################################################################

        # transpose
        transposed_change = list(zip(*change_list))
        # create lists for each column
        columns_change = [list(column) for column in transposed_change]

        # convert to numpy array
        change_matrix = np.array(columns_change).T

        # matrix_stim is ONE BLOCK of columns for the filepaths
        # matrix_prob is ONE BLOCK of columns for the probabilities
        # change_matrix is ONE BLOCK of vectors containing ([old_tochange, old_index, to_change, new_index, sentence])
        return matrix_stim, matrix_prob, matrix_probFixed, change_matrix

    # call the function 4 times and store the results

    stim_1, prob_1, prob_1_fixed, change_1 = create_one_block()
    stim_2, prob_2, prob_2_fixed, change_2 = create_one_block()
    stim_3, prob_3, prob_3_fixed, change_3 = create_one_block()
    stim_4, prob_4, prob_4_fixed, change_4 = create_one_block()
    stim_5, prob_5, prob_5_fixed, change_5 = create_one_block()
    stim_6, prob_6, prob_6_fixed, change_6 = create_one_block()
    stim_7, prob_7, prob_7_fixed, change_7 = create_one_block()
    stim_8, prob_8, prob_8_fixed, change_8 = create_one_block()

    # concatenate the matrices together vertically
    # concatenated_stim = ALL the 16 blocks of filepaths put together as one long column
    concatenated_stim = np.vstack(
        (stim_1, stim_2, stim_3, stim_4, stim_5, stim_6, stim_7, stim_8))
    # concatenated_prob = ALL the 16 blocks of probabilities put together as one long column
    concatenated_prob = np.vstack(
        (prob_1, prob_2, prob_3, prob_4, prob_5, prob_6, prob_7, prob_8))

    # concatenated_prob_fixed = ALL the 16 blocks of probabilities put together as one long column
    concatenated_prob_fixed = np.vstack(
        (prob_1_fixed, prob_2_fixed, prob_3_fixed, prob_4_fixed, prob_5_fixed, prob_6_fixed, prob_7_fixed, prob_8_fixed))

    concatenated_change = np.vstack(
        (change_1, change_2, change_3, change_4, change_5, change_6, change_7, change_8))

    ########################################################################
    ############## DRAWING CORRECT ACCORDING TO PROBABILITIES ##############
    ########################################################################
    # Function to apply the logic
    def draw_correct_according_to_prob(row):
        result_vector = []
        choose_reveal = random.random()

        for i, probability in enumerate(row):
            if choose_reveal < probability:
                if i == 0:
                    result_vector.append("stimLeft")
                elif i == 1:
                    result_vector.append("stimCenter")
                elif i == 2:
                    result_vector.append("stimRight")
            else:
                result_vector.append("miss")

        return result_vector

    # Applying the logic to each row
    fullExp_corrAnswer = [draw_correct_according_to_prob(row) for row in concatenated_prob]

    ########################################################################
    ################### CREATING NORMALIZED PROBABILITIES ##################
    ########################################################################
    def normalize_probabilities(probability_vectors):
        normalized_vectors = []

        for prob_vector in probability_vectors:
            norm_prob = prob_vector / np.sum(prob_vector)
            normalized_vectors.append(norm_prob)

        return np.array(normalized_vectors)  # Convert to column vector

    normalized_probs = normalize_probabilities(concatenated_prob)


    ########################################################################
    ################## CREATING BACKGROUND STIMULUS MATRIX #################
    ########################################################################

    def split_file_paths(file_paths, num_paths):
        # make sure requested number of paths is not greater than total number of paths available
        num_paths_in_rew_inst = min(num_paths, len(file_paths))

        # randomly split 4 of the file paths into one condition
        block1 = random.sample(file_paths, num_paths)
        # remaining is placed here
        block2 = [path for path in file_paths if path not in block1]

        return block1

    reward_filepaths = ['resources/bagshop.png', 'resources/car.png', 'resources/boat.png', 'resources/desert.png',
                        'resources/casino.png', 'resources/shop.png', 'resources/stocks.png', 'resources/vault.png']
    perc_filepaths = ['resources/cave.png', 'resources/forest.png', 'resources/ocean.png', 'resources/swamp.png',
                      'resources/road.png', 'resources/city.png', 'resources/barn.png', 'resources/train.png']

    num_paths = 4
    rew_inst = split_file_paths(reward_filepaths, num_paths)
    perc_inst = split_file_paths(perc_filepaths, num_paths)

    def generate_background_img(list_of_images):
        ### IN CASE YOU NEED TO, CHANGE THIS TOO!!!! ###
        full_condition = []
        trialsPerBlock = 36
        numberBlocks = 4
        trials_in_cond = trialsPerBlock*numberBlocks
        i = 0

        # copy the original list just in case we need original...
        bgImg_list = list_of_images

        # pop a random element from the copy of bgImg_list
        sampled_value1 = bgImg_list.pop(random.randint(0, len(bgImg_list) - 1))
        sampled_value2 = bgImg_list.pop(random.randint(0, len(bgImg_list) - 1))
        sampled_value3 = bgImg_list.pop(random.randint(0, len(bgImg_list) - 1))
        sampled_value4 = bgImg_list.pop(random.randint(0, len(bgImg_list) - 1))

        while i < trials_in_cond:
            # append
            if i >= 0 and i < trialsPerBlock:
                full_condition.append(sampled_value1)
            elif i >= trialsPerBlock and i < trialsPerBlock*2:
                full_condition.append(sampled_value2)
            elif i >= trialsPerBlock*2 and i < trialsPerBlock*3:
                full_condition.append(sampled_value3)
            elif i >= trialsPerBlock*3 and i < trialsPerBlock*4:
                full_condition.append(sampled_value4)

            i += 1

        return np.array(full_condition)[:, np.newaxis] # Convert to column vector


    # call function
    rew_inst_0 = generate_background_img(rew_inst)
    perc_inst_1 = generate_background_img(perc_inst)

    # concatenate in CORRECT ORDER - will shuffle later in condition file on psychopy
    final_background = np.vstack((rew_inst_0, perc_inst_1))
   # print("background images", final_background)

    ########################################################################
    ################### ADDING ALL THE VECTORS TOGETHER ####################
    ########################################################################

    # concatenate ALL FINAL MATRICES
    final_matrix = np.concatenate((final_background, concatenated_stim, concatenated_prob, normalized_probs, fullExp_corrAnswer, concatenated_change), axis=1)

    ########################################################################
    ########## GENERATING DYNAMICALLY NAMED FILE NAMES OF STIMULI ##########
    ########################################################################
    # generate differently named files according to the number of iterations
    final_stim = pd.DataFrame(final_matrix,
                              columns=['blockImg', 'stim1', 'stim2', 'stim3', 'stim1prob', 'stim2prob', 'stim3prob', 'normProb1', 'normProb2', 'normProb3', 'corrAns1', 'corrAns2', 'corrAns3', 'oldAlien', 'oldAlienIndex', 'newAlien', 'newAlienIndex', 'sentence'])
    final_stim.to_excel(f'FMRI_finalStims_stimuli_iter_{number_of_files}.xlsx', index=False)

    final_prob = pd.DataFrame(concatenated_prob, columns=['stim1', 'stim2', 'stim3'])
    final_prob.to_excel(f'FMRI_onlyProbs_stimuli_iter_{number_of_files}.xlsx', index=False)

    final_prob_fixed = pd.DataFrame(concatenated_prob_fixed, columns=['stim1','stim2','stim3'])
    final_prob_fixed.to_excel(f'FMRI_onlyProbsFixed_stimuli_iter_{number_of_files}.xlsx', index=False)

    final_change = pd.DataFrame(concatenated_change,
                                columns=['oldAlien', 'oldAlienIndex', 'newAlien', 'newAlienIndex', 'sentence'])
    final_change.to_excel(f'FMRI_finalChange_iter_{number_of_files}.xlsx', index=False)


# CALLING FUNCTION FOR 4 TRIES
for i in range(1, 4):  # if you want 5, you put (1,6)
    final_generations(i)
