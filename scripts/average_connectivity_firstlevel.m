%Isolate the auditory-auditory section of the matrix
childhood_auditory = Z(1:18,1:18,:);

%Isolate the top half of the corr matrix for each liking rating (aud-aud)
for sub = 1:58
    
    temp = childhood_auditory(:,:,sub);
    childhood_auditory_byparticipant(:,sub) = temp(find(~tril(ones(size(temp)))));
    childhood_auditory_participant_mean = mean(childhood_auditory_byparticipant);    
end
childhood_auditory_participant_mean = childhood_auditory_participant_mean'

%Isolate the reward-reward section of the matrix
childhood_reward = Z(19:36,19:36,:);

%Isolate the top half of the corr matrix for each liking rating (reward-reward)
for sub = 1:35
    
    temp = childhood_reward(:,:,sub);
    childhood_reward_byparticipant(:,sub) = temp(find(~tril(ones(size(temp)))));
    childhood_reward_participant_mean = mean(childhood_reward_byparticipant);    
end
childhood_reward_participant_mean = childhood_reward_participant_mean'

%Isolate the auditory-reward section of the matrix
childhood_reward_auditory = Z(1:18,19:36,:);

%Get the mean for each participant across the matrix (aud-rew)
for sub = 1:35
    
    childhood_auditory_reward_mean(:,sub) = mean(childhood_reward_auditory(:,:,sub), 'all');
end

childhood_auditory_reward_mean = childhood_auditory_reward_mean'

%mpfc - auditory
childhood_mpfc_auditory=Z(1:18,31,:);

%Get the mean for each participant across the matrix (mpfc-aud)
for sub = 1:35
    
    childhood_mpfc_auditory_mean(:,sub) = nanmean(childhood_mpfc_auditory(:,:,sub), 'all');
end

childhood_mpfc_auditory_mean = childhood_mpfc_auditory_mean'

%mpfc - reward
childhood_mpfc_reward=Z(19:36,31,:);

%Get the mean for each participant across the matrix (mpfc-rew)
for sub = 1:35
    
    childhood_mpfc_reward_mean(:,sub) = nanmean(childhood_mpfc_reward(:,:,sub), 'all');
end
childhood_mpfc_reward_mean = childhood_mpfc_reward_mean'

%hc - nac
childhood_hc_nac=Z(31:32,35:36,:);

%Get the mean for each participant across the matrix (mpfc-rew)
for sub = 1:35
    
    childhood_hc_nac_mean(:,sub) = nanmean(childhood_hc_nac(:,:,sub), 'all');
end
childhood_hc_nac_mean = childhood_hc_nac_mean'

writematrix(childhood_auditory_participant_mean, 'childhood_auditory_participant_mean.csv')
writematrix(childhood_reward_participant_mean, 'childhood_reward_participant_mean.csv')
writematrix(childhood_auditory_reward_mean, 'childhood_reward_auditory_mean.csv')
writematrix(childhood_mpfc_auditory_mean, 'childhood_mpfc_auditory_mean.csv')
writematrix(childhood_mpfc_reward_mean, 'childhood_mpfc_reward_mean.csv')
writematrix(childhood_hc_nac_mean, 'childhood_hc_nac_mean.csv')